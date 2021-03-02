variable "LinuxAMI" {
  type    = string
  default = "ami-096fda3c22c1c990a"
}

#Windows Server 2004 Core
#variable "WindowsAMI" {
#  type    = string
#  default = "ami-001b0b8376afad6d4"
#}

variable "WindowsAMI" {
  type    = string
  default = "ami-02642c139a9dfb378"
}
variable "domain_name"{
  type    = string
  default = "pericogallochivo.lab"
}

variable "dc01" {
  type    = string
  default = "SRE-DC01"
}

variable "dc02" {
  type    = string
  default = "SRE-DC02"
}

variable "dcpassword" {
  type    = string
  default = "Alacran Don Julio 200Conejos"
}

variable "teamips" {
    type = list
    default = ["189.186.28.176/32"]
}