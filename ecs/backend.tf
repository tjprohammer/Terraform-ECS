#storing code to Terraform Cloud
terraform {
  backend "remote" {
      hostname = "photo.tjprohammer.us"
      organization = "tjprohammer dev"

      workspaces {
          prefix = "tjprohammer-us-ecs"
      }
  }
}