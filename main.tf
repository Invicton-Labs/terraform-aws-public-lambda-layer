data "http" "package_metadata" {
  url = "https://pll.invictonlabs.com/packages/${local.var_package}/${local.var_package_version}/${local.var_runtime}/${local.var_architecture}/${local.var_region}.json"
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  metadata = jsondecode(data.http.package_metadata.response_body)
}
