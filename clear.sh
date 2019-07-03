#!/bin/bash
set -x
set -e
if [ ! -f "variables.env" ]
then
    echo "$0: variables.env not found. Please fill out from template"
fi

source variables.env

check_env_vars () {
  for name; do
    : ${!name:?$name must not be empty}
  done
}
if ! check_env_vars "RG_OPENSHIFT" "RG_KEYGROUP"; then
    exit 1
fi

rm -rf openshift-container-platform
az group delete --name $RG_OPENSHIFT
az group delete --name $RG_KEYGROUP
sed -i '/RG_KEYGROUP/d' variables.env
az ad sp delete --id "http://open2hiftsp"
rm ~/.ssh/azure_openshift_rsa*
