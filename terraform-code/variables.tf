variable "availability_zone" {
  type    = string
  default = "eu-central-1"
}

variable "sub_availability_zone" {
  type    = string
  default = "eu-central-1a"
}

variable "network_cidr" {
  description = "IP addressing for the network"
  default     = "10.14.184.192/27"
}

variable "subnet_cidr" {
  default = "10.14.184.192/28"
}

variable "instance-type" {
  default = "t3.large"

}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}
