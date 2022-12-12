# Automated testing examples

This folder contains examples of how to write automated tests for infrastructure code using Go and
[Terratest](https://terratest.gruntwork.io/).

## Pre-requisites

* You must have [Go](https://go.dev/) installed on your computer (minimum version 1.13).
* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Digital Ocean account](https://www.digitalocean.com/).

## Quick start

**Please note that these automated tests will deploy real resources into your Digital Ocean project therefore additional costs may incur.**

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

Run all the tests:

```
go test -v -timeout 90m
```

Run one specific test:

```
go test -v -timeout 90m -run '<TEST_NAME>'
```