terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = ["subnet-0a7a46a11793529da", "subnet-0712006e66056ca60"] # Replace with your subnet IDs
  }
   
  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_cluster_auth" "example" {
  name = aws_eks_cluster.example.name

  depends_on = [aws_eks_cluster.example]
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

output "kubeconfig" {
  value = aws_eks_cluster.example.kubeconfig
}
