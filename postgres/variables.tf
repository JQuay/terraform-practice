variable "instance_class" {
  description= "The instance class for the RDS instance"
  default = "db.t3.micro"
  type = string
}

variable "db_name" {
  description= "The name of  the RDS instance"
  default = "postgres"
  type = string
}



variable "parameter_group_name" {
    default = "default.postgres13"
  type = string
}


variable "engine_version" {
    default = "13.8"
  type = string
}


variable "common_tags" {
  type = map(any)

  default = {
    "Asset_ID" = "250"
    "AssetName" = "Postgres"
    "Team" = "Infra"
    "Environment" = "Dev"
    "Project" = "alpha"
    "CloudProvider" = "AWS"
    "CreatedBy" = "Terraform"
      }
  
}