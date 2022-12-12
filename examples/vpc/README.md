# DigitalOcean VPC example

This folder contains a [Terraform](https://www.terraform.io/) configuration that shows an example of to use the [vpc module](../../modules/network/vpc) to deploy a VPC (using [VPC](https://docs.digitalocean.com/products/networking/vpc/)) in a [Digital Ocean project](https://www.digitalocean.com/).

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Digital Ocean account](https://www.digitalocean.com/).

Please note that this code was written for Terraform 1.x.

## Quick start

**Please note that this example will deploy real resources into you Digital Ocean project at no additional cost.**

Configure the Terraform variable that contains your [Digital Ocean Personal Access Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) by running:

<details><summary>Powershell</summary>
<p>

```
$env:TF_VAR_do_token="(your personal access token)"
```

</p>
</details>

<details><summary>Bash</summary>
<p>

```
export TF_VAR_do_token="(your personal access token)"
```

</p>
</details>

Deploy the code:

```
terraform init
terraform apply
```

Clean up when you're done:

```
terraform destroy
```