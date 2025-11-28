terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "eks_environment" {
  source = "../../modules/eks_environment"

  environment         = var.environment
  vpc_cidr            = "10.0.0.0/16"
  eks_cluster_version = "1.30"

  node_desired_size   = 2
  node_min_size       = 1
  node_max_size       = 4
  node_instance_types = ["t3.medium"]
  node_capacity_type  = "ON_DEMAND"
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks_environment.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = module.eks_environment.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded CA certificate"
  value       = module.eks_environment.cluster_certificate_authority_data
}
