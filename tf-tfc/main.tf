terraform {
  backend "remote" {
    organization = "tkaburagi"

    workspaces {
      name = "tfc-vars-azure-vault-circle-ci"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}

// TODO: Set valut, Set var
variable "workspace_id" {}
variable "arm_client_id" {}
variable "arm_client_secret" {}
variable "arm_tenant_id" {}
variable "arm_sub_id" {}

resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  sensitive = true
  workspace_id = var.workspace_id
}

resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  sensitive = true
  workspace_id = var.workspace_id
}

resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  sensitive = true
  workspace_id = var.workspace_id
}

resource "tfe_variable" "arm_sub_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_sub_id
  category     = "env"
  sensitive = true
  workspace_id = var.workspace_id
}