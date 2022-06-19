variable "package" {
  description = "The name of the package to get a layer for."
  type        = string
  validation {
    condition     = var.package != null
    error_message = "The `package` input variable may not be `null`."
  }
}
locals {
  var_package = var.package
}

variable "package_version" {
  description = "The version of the package to get a layer for."
  type        = string
  validation {
    condition     = var.package_version != null
    error_message = "The `package_version` input variable may not be `null`."
  }
}
locals {
  var_package_version = var.package_version
}

variable "runtime" {
  description = "The runtime of the Lambda function that the layer will be used for."
  type        = string
  validation {
    condition     = var.runtime != null
    error_message = "The `runtime` input variable may not be `null`."
  }
}
locals {
  var_runtime = var.runtime
}

variable "architecture" {
  description = "The architecture of the Lambda function that the layer will be used for. Must be `x86_64` or `arm64`."
  type        = string
  validation {
    condition     = var.architecture != null
    error_message = "The `architecture` input variable may not be `null`."
  }
  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "The `architecture` input variable must be either `x86_64` or `arm64`."
  }
}
locals {
  var_architecture = var.architecture
}

variable "region" {
  description = "The AWS region of the Lambda function that the layer will be used for."
  type        = string
  validation {
    condition     = var.region != null
    error_message = "The `region` input variable may not be `null`."
  }
}
locals {
  var_region = var.region
}
