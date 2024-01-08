variable "InstanceName" {
    type = string
    default = "TF_insance"
  
}

variable "ami" {
    type = string
    default = "ami-03265a0778a880afb"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "InboundDescription" {
    type = string
    default = "MyInbound"
  
}

variable "From_Port" {
    type=number
    default = 0  
}

variable "To_Port" {
    type=number
    default = 0  
}

variable "CIDR_Block" {
    type=list
    default = ["0.0.0.0/0"]
}

variable "SG-tagname" {
    type = string
    default = "MySG-1"
  
}

variable "SecurityGroup" {
    type = string
    default = "MySecurityGroup"
  
}
