#Secify your account details to access AWS
provider "aws" {
  shared_credencials = "$HOME/.aws/credencials"
  profile = var.aws_profile
  region = var.region
}