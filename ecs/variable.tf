variable "config" {
  type = object({
    environment = string
    region = string
    profile = string
    projectName = string
  })
}
