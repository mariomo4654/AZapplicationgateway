#!/bin/bash
#az account set --subscription 9c9ec17e-5891-48ae-b268-10a820808ebd
RgName=mariorg

# Retrieve the location of the resource group and assign it to a variable
Location=$(az group show --name $RgName --query location -o tsv)

date
# Create a Virtual Network for the VMs
echo '------------------------------------------'
echo 'Creating a Virtual Network for the VMs'
az network vnet create \
    --resource-group $RgName \
    --location $Location \
    --name bePortalVnet \
    --subnet-name bePortalSubnet 

# Create a Network Security Group
echo '------------------------------------------'
echo 'Creating a Network Security Group'
az network nsg create \
    --resource-group $RgName \
    --name bePortalNSG \
    --location $Location

az network nsg rule create -g $RgName --nsg-name bePortalNSG -n AllowAll80 --priority 101 \
                            --source-address-prefixes 'Internet' --source-port-ranges '*' \
                            --destination-address-prefixes '*' --destination-port-ranges 80 --access Allow \
                            --protocol Tcp --description "Allow all port 80 traffic"


# Create the NIC
for i in `seq 1 2`; do
  echo '------------------------------------------'
  echo 'Creating webNic'$i
  az network nic create \
    --resource-group $RgName \
    --name webNic$i \
    --vnet-name bePortalVnet \
    --subnet bePortalSubnet \
    --network-security-group bePortalNSG \
    --location $Location
done 


# Create 2 VM's from a template
for i in `seq 1 2`; do
    echo '------------------------------------------'
    echo 'Creating webVM'$i
    az vm create \
        --admin-username azureuser \
        --resource-group $RgName \
        --name webVM$i \
        --nics webNic$i \
        --location $Location \
        --image Ubuntu2204 \
        --generate-ssh-keys \
        --custom-data cloud-init.txt
done

# Done
echo '--------------------------------------------------------'
echo '             VM Setup Completed'
echo '--------------------------------------------------------'









