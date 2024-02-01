variable "vpc_cidr" {
  description = "vpc cidr range"
  type = string
}

variable "subnet_cidrs" {
  description = "THESE THE THE CIDRS FOR SUBNET"
  type = list(string)
}