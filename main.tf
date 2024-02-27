
resource "aws_db_instance" "postgresql" {
  identifier            = "database-1"
  instance_class        = var.instance_class
  allocated_storage     = 20
  engine                = "postgres"
  engine_version        = var.engine_version
  name                  =  format("%s", var.common_tags["Project"]) #"${var.db_name}"
  parameter_group_name  =  var.parameter_group_name
  #initial_database_name = "postgres"
  username              = "postgres"
  password              = "postgres"
  skip_final_snapshot      = true
  #parameter_group_name  = "default.postgres13"
  storage_type          = "gp2"

  tags= merge(var.common_tags, {
    Name = format("%s-%s-%s-artifactory-db", var.common_tags["Asset_ID"], var.common_tags["Environment"], var.common_tags["Project"])
  })

}

resource "aws_security_group" "postgresql_sg" {
  name        = "postgresql_sg"
  description = "Security group for PostgreSQL database"
  
  // Allow inbound traffic only from your VPC or specific IP addresses
  // Adjust the rules as per your requirements
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"] // Replace with your VPC CIDR block or IP address
  }

  // Allow outbound traffic as required
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# resource "aws_db_parameter_group" "postgresql_parameters" {
#   name        = "postgresql-parameters"
#   family      = "postgres13" // Adjust based on the PostgreSQL version you are using

#   parameter {
#     name  = "dbname"
#     value = "postgres"
#   }
# }

resource "aws_db_subnet_group" "default" {
  name       = "your-db-subnet-group"
  subnet_ids = ["subnet-0a7a46a11793529da", "subnet-0712006e66056ca60"]  # Replace with your subnet IDs
}

# output "db_endpoint" {
#   value = aws_db_instance.postgresql.endpoint
# }
