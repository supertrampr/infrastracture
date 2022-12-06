variable "imagepull_secret_name" {
  description = "Name of the secret to create in the k8s cluster."
  type        = string
}

variable "imagepull_secret_namespace" {
  description = "Namespace where to create the resource."
  type        = string
}

variable "imagepull_secret_key" {
  description = "Key of secret data."
  type        = string
}

variable "imagepull_secret_type" {
  description = "K8S resource type of the secret."
  type        = string
}