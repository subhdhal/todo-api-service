variable "environment" {
  type        = string
}

variable "vpc_cidr" {
  type        = string
}

variable "eks_cluster_version" {
  type        = string
  default     = "1.30"
}

variable "node_desired_size" {
  type        = number
  default     = 2
}

variable "node_min_size" {
  type        = number
  default     = 1
}

variable "node_max_size" {
  type        = number
  default     = 4
}

variable "node_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_capacity_type" {
  type        = string
  default     = "ON_DEMAND"
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
}

