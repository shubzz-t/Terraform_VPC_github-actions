variable "sg_id" {
  description = "sg id"
  type = string
}

variable "subnets" {
  description = "SUBNETS "
  type = list(string)
}

variable "ec2_names" {
  description = "ec2 names"
  type = list(string)
  default = [ "webserver1" , "webserver2" ]
}