#!/bin/bash
set -x
set -e

exec &> >(tee -a "output.log")



if [ ! -f "variables.env" ]
then
    echo "$0: variables.env not found. Please fill out from template"
fi

echo "export RG_KEYGROUP=rgkeyvault$RANDOM" >> variables.env

source variables.env

check_env_vars () {
  for name; do
    : ${!name:?$name must not be empty}
  done
}
if ! check_env_vars "AZ_REGION" "AZ_USERNAME" "AZ_PASSWORD" "RH_USERNAME" "RH_PASSWORD" "RH_POOLID" "RG_OPENSHIFT"; then
    exit 1
fi





#keyvault section
az group create --name $RG_KEYGROUP --location $AZ_REGION

#create vault
az keyvault create --resource-group $RG_KEYGROUP --name $RG_KEYGROUP \
       --enabled-for-template-deployment true \
       --location $AZ_REGION

#create a new ssh key
ssh-keygen -f ~/.ssh/azure_openshift_rsa -t rsa -N ''
az keyvault secret set --vault-name $RG_KEYGROUP --name keysecret --file ~/.ssh/azure_openshift_rsa

#create resources group
az group create -l $AZ_REGION -n $RG_OPENSHIFT
scope=`az group show --name $RG_OPENSHIFT --query id`
string=`openssl rand -base64 32 | head -c${1:-10};echo;`; 
password=${string}=
eval "$(az ad sp create-for-rbac --name "http://open2hiftsp" \
      --role Contributor --password "${password}" \
      --scopes ${scope} --skip-assignment | jq -r '@sh "AZ_APP_ID=\(.appId) AZ_APP_PASS=\(.password)"')"

if ! check_env_vars "AZ_APP_ID" "AZ_APP_PASS"; then
    exit 1
fi

#clonning openshift MS code
git clone https://github.com/Microsoft/openshift-container-platform
cd openshift-container-platform

#configuring setup
export PUBKEY=`cat ~/.ssh/azure_openshift_rsa.pub` 
m4 ../azuredeploy.parameters.json.m4 > azuredeploy.parameters.json

#deployment
az group deployment create -g $RG_OPENSHIFT --name OpenShiftCluster --template-uri https://raw.githubusercontent.com/Microsoft/openshift-container-platform/master/azuredeploy.json --parameters @./azuredeploy.parameters.json | tee >(jq '.properties.outputs.openshiftConsoleUrl.value'|tr -d '"'> console.url)

set +x
echo "Please connect to web-console:"
cat console.url
