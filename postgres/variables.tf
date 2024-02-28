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




variable "postgres" {
  type = map(any)
  default = {
     instance_class = "db.t3.micro"
     db_name = "postgres"
     parameter_group_name = "default.postgres13"
     engine_version = "13.8"
     storage_type          = "gp2"
     engine                = "postgres"
     allocated_storage     = 20
     identifier            = "database-1"
     instance_class        = "db.t3.micro"
  }
  
}