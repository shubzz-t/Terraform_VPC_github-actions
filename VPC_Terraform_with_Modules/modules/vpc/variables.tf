variable "vpc_cidr" {
  description = "vpc cidr range"
  type = string
}

variable "subnet_cidrs" {
  description = "THESE THE THE CIDRS FOR SUBNET"
  type = list(string)
}

variable "subnet_names" {
  description = "Names for the subnets"
  type = list(string)
  default = [ "PublicSubnet1" , "PublicSubnet2" ]
}