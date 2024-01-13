
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_tags" {
    type = map
    default = {}  // if declaired like this it is an options 

}

variable "common_tags" {
    type = map
    default = {}  // if declaired like this it is an options 

}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}


variable "project_name" {
    type = string 
}

variable "environment" {
    type = string
}

variable "ig_tags" {
    type = map
    default = {} 
}


variable "public_subnets_cidr" {
  type        = list
  description = "public subnet cidr block description"
  validation {
    condition = length(var.public_subnets_cidr) == 2
    error_message = "please enter 2 public subnets"
  }
}

variable "private_subnets_cidr" {
  type        = list
  description = "public subnet cidr block description"
  validation {
    condition = length(var.private_subnets_cidr) == 2
    error_message = "please enter 2 private subnets"
  }
}

variable "database_subnets_cidr" {
  type        = list
  description = "private subnet cidr block description"
  validation {
    condition = length(var.database_subnets_cidr) == 2
    error_message = "please enter 2 database subnets"
  }
}


variable "public_subnets_tags" {
  default = {}
}

variable "nat_gateway_tags" {
    default = {}
  
}

variable "public_route_table_tags" {
    default = {}
  
}