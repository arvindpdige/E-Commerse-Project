terraform {
  backend "azurerm" {
    use_msi              = true                                    # Can also be set via `ARM_USE_MSI` environment variable.
    use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
    storage_account_name = "mystorageforadf"                       # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                 #blob name where state file is written  # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.      
  }
}