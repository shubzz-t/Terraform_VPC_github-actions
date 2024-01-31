variable "sg_id" {
  description = "sg id for load balancer"
  type = string
}

variable "subnets" {
  description = "subnets for alb"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc id for alb"
  type = string
}

variable "instances" {
  description = "instance id for target group attachment"
  type = list(string)
}