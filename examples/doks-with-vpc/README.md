# DOKS example

This folder contains a [Terraform](https://www.terraform.io/) configuration that shows an example of to use the [doks module](../../modules/services/doks) to deploy a Kubernetes cluster (using [DOKS](https://docs.digitalocean.com/products/kubernetes/) with a custom [VPC](https://docs.digitalocean.com/products/networking/vpc/)) in a [Digital Ocean project](https://www.digitalocean.com/).

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Digtial Ocean account](https://www.digitalocean.com/).

## Quick start

**Please note that this example will deploy real resources into you Digital Ocean project therefore costs may occur.**

Configure the Terraform variable that contains your [Digital Ocean Personal Access Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) by running:

```
$env:TF_VAR_do_token="(your personal access token)"
```

Deploy the code:

```
terraform init
terraform apply
```

Clean up when you're done:

```
terraform destroy
```