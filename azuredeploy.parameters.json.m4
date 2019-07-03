divert(-1)
define(`getenv', `esyscmd(printf -- "$`$1'")')
divert dnl
{
	"$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
	"contentVersion": "1.0.0.0",
	"parameters": {
		"_artifactsLocation": {
			"value": "https://raw.githubusercontent.com/Microsoft/openshift-container-platform/master"
		},
		"masterVmSize": {
			"value": "Standard_E2s_v3"
		},
		"infraVmSize": {
			"value": "Standard_D4s_v3"
		},
		"nodeVmSize": {
			"value": "Standard_D4s_v3"
		},
		"cnsVmSize": {
			"value": "Standard_E4s_v3"
		},
		"osImageType": {
			"value": "defaultgallery"
		},
		"marketplaceOsImage": {
			"value": {
				"publisher": "RedHat",
				"offer": "RHEL",
				"sku": "7-RAW",
				"version": "latest"
			}
		},
		"storageKind": {
			"value": "managed"
		},
		"openshiftClusterPrefix": {
			"value": "openshift"
		},
		"masterInstanceCount": {
			"value": 3
		},
		"infraInstanceCount": {
			"value": 2
		},
		"nodeInstanceCount": {
			"value": 2
		},
		"dataDiskSize": {
			"value": 128
		},
		"adminUsername": {
			"value": "getenv(ADMIN_USERNAME)"
		},
		"openshiftPassword": {
			"value": "getenv(OPENSHIFT_PASSWORD)"
		},
		"enableMetrics": {
			"value": "true"
		},
		"enableLogging": {
			"value": "false"
		},
		"enableCNS": {
			"value": "false"
		},
		"rhsmUsernameOrOrgId": {
			"value": "getenv(RH_USERNAME)"
		},
		"rhsmPasswordOrActivationKey": {
			"value": "getenv(RH_PASSWORD)"
		},
		"rhsmPoolId": {
			"value": "getenv(RH_POOLID)"
		},
		"rhsmBrokerPoolId": {
			"value": "getenv(RH_POOLID)"
		},
		"sshPublicKey": {
			"value": "getenv(PUBKEY)"
		},
		"keyVaultResourceGroup": {
			"value": "getenv(RG_KEYGROUP)"
		},
		"keyVaultName": {
			"value": "getenv(RG_KEYGROUP)"
		},
		"keyVaultSecret": {
			"value": "keysecret"
		},
		"enableAzure": {
			"value": "false"
		},
		"aadClientId": {
			"value": "getenv(AZ_APP_ID)"
		},
		"aadClientSecret": {
			"value": "getenv(AZ_APP_PASS)"
		},
		"masterClusterDnsType": {
			"value": "default"
		},
		"masterClusterDns": {
			"value": "console.contoso.com"
		},
		"routingSubDomainType": {
			"value": "nipio"
		},
		"routingSubDomain": {
			"value": "apps.contoso.com"
		},
		"virtualNetworkNewOrExisting": {
			"value": "new"
		},
		"virtualNetworkName": {
			"value": "rh_openstack"
		},
		"addressPrefixes": {
			"value": "10.0.0.0/14"
		},
		"masterSubnetName": {
			"value": "rhopenstack_master"
		},
		"masterSubnetPrefix": {
			"value": "10.1.0.0/16"
		},
		"infraSubnetName": {
			"value": "infrasubnet"
		},
		"infraSubnetPrefix": {
			"value": "10.2.0.0/16"
		},
		"nodeSubnetName": {
			"value": "rhopenstack_node"
		},
		"nodeSubnetPrefix": {
			"value": "10.3.0.0/16"
		},
		"existingMasterSubnetReference": {
			"value": "/subscriptions/abc686f6-963b-4e64-bff4-99dc369ab1cd/resourceGroups/vnetresourcegroup/providers/Microsoft.Network/virtualNetworks/openshiftvnet/subnets/mastersubnet"
		},
		"existingInfraSubnetReference": {
			"value": "/subscriptions/abc686f6-963b-4e64-bff4-99dc369ab1cd/resourceGroups/vnetresourcegroup/providers/Microsoft.Network/virtualNetworks/openshiftvnet/subnets/infrasubnet"
		},
		"existingCnsSubnetReference": {
			"value": "/subscriptions/abc686f6-963b-4e64-bff4-99dc369ab1cd/resourceGroups/vnetresourcegroup/providers/Microsoft.Network/virtualNetworks/openshiftvnet/subnets/cnssubnet"
		},
		"existingNodeSubnetReference": {
			"value": "/subscriptions/abc686f6-963b-4e64-bff4-99dc369ab1cd/resourceGroups/vnetresourcegroup/providers/Microsoft.Network/virtualNetworks/openshiftvnet/subnets/nodesubnet"
		},
		"masterClusterType": {
			"value": "public"
		},
		"masterPrivateClusterIp": {
			"value": "10.1.0.200"
		},
		"routerClusterType": {
			"value": "public"
		},
		"routerPrivateClusterIp": {
			"value": "10.2.0.200"
		},
		"routingCertType": {
			"value": "selfsigned"
		},
		"masterCertType": {
			"value": "selfsigned"
		},
		"proxySettings": {
			"value": "none"
		},
		"httpProxyEntry": {
			"value": ""
		},
		"httpsProxyEntry": {
			"value": ""
		},
		"noProxyEntry": {
			"value": ""
		},
		"customHeaderImage": {
			"value": ""
		}
	}
}
