---
page_type: sample
languages:
- azurecli
products:
- azure-load-balancer
description: "Set up a virtual network with two virtual machines"
urlFragment: "https://github.com/mariomo4654/AZapplicationgateway.git"
---

# Official Microsoft Sample

<!-- 
Guidelines on README format: https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

Guidance on onboarding samples to docs.microsoft.com/samples: https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

Taxonomies for products and languages: https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master
-->

Set up a load balancer to use in learn module exercise for "Host your domain on Azure DNS". Script creates:
- Virtual network for the VMs
- Network security group
- Two network interfaces
- Two virtual machines from a template




## Contents



| File/folder       | Description                                |
|-------------------|--------------------------------------------|


| `README.md`       | This README file.                          |                      |
|`cloud-init.txt`             |Cloud-init script to configure the virtual machines     |
|`setup.sh`             | Script to set up and deploy in Azure CLI                        |

## Prerequisites

The script is intended to be run from a BASH prompt in Azure Cloud Shell.

## Setup

run `bash src/setup.sh` to build virtual machines, and virtual network.

## Running the sample

To run the set-up script, run the following commands in Azure Cloud Shell:

  ```bash
  cd mslearn-host-domain-azure-dns  
  chmod +x setup.sh  
  ./setup.sh
