variable "vpc_id" {}
variable "igw_id" {}
variable "availability_zone" {}
variable "cidr_block" {}
variable "ipv6_cidr_block" {}
variable "map_public_ip_on_launch" {
  default = false
}
