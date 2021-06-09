variable "web" {
  description = "set to true to include web tier"
  default = false
}

variable "app" {
  description = "set to true to include app tier"
  default = false
}

variable "database" {
  description = "set to true to include database tier"
  default = false
}

variable "project" {}


variable "prefix" {
  description = "name of application/developer - serves as prefix for resources to keep them unique"
  type        = string
}


variable "webserver_instance_config" {
  type = object({
    disk_image   = string
    disk_size    = string
    disk_type    = string
    target_size  = string
    machine_type = string
  })
  default = {
    disk_image   = "webserver_windows"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }
}

variable "database_instance_config" {
  type = object({
    disk_image   = string
    disk_size    = string
    disk_type    = string
    target_size  = string
    machine_type = string
  })
  default = {
    disk_image   = "database_windows"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }
}

variable "app_server_instance_config" {
  type = object({
    disk_image     = string
    disk_size      = string
    disk_type      = string
    target_size    = string
    machine_type   = string
  })
  default = {
    disk_image     = "appserver_windows"
    disk_size      = "200"
    disk_type      = "pd-ssd"
    target_size    = "1"
    machine_type   = "n1-standard-1"
  }
}


variable "labels" {
  description = "labels (tags) to apply to the instance"
  type        = map(string)
  default = {
    "os"   = "windows"
    "tier" = "3"
  }
}

variable "firewall_ports" {
  type        = list(string)
  description = "Additional ports to allow through the firewall"
  default     = [""]
}

variable "ip_allow_list" {
  type        = list(string)
  description = "IP CIDRs to alow"
  default     = ["0.0.0.0/0"]
}

variable "region" {
  type = string
  description = "region to deploy into"
  default = "europe-west2"
}

variable "subnet_range" {
  type = string
  description = "IP CIDR range for subnet"
  default = ""
}

variable "web_startup_script" {
  default = ""
}

variable "app_startup_script" {
  default = ""
}

variable "database_startup_script" {
  default = ""
}


