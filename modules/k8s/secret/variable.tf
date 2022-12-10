variable "name" {
  description = "Name of the secret to create in the k8s cluster."
  type        = string
}

variable "namespace" {
  description = "Namespace where to create the resource."
  type        = string
}

variable "key" {
  description = "Key of secret data."
  type        = string
}

variable "value" {
  description = "Value of secret data."
  type        = string
}

variable "type" {
  description = "K8S resource type of the secret."
  type        = string
}