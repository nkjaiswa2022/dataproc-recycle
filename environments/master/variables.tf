# Variable definitions go here
variable "project" { 
}

variable "location" {
  type = string
  default = "US"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}


variable "environment" {
  type = string
  default = "master"
}

variable "machine_types" {
  type = "map"
  default = {
    "worker" = "c2-standard-30"
    "master" = "c2-standard-30"
    "preemptible" = "c2-standard-30"
  }
}

variable "disk_type" {
  type = "map"
  default = {
    "worker" = "pd-ssd"
    "master" = "pd-ssd"
    "preemptible" = "pd-ssd"
  }
}

variable "disk_image" {
   type = string
   default = "debian-cloud/debian-10"
 }

variable "disk_size" {
  type = "map"
  default = {
    "worker" = 500
    "master" = 500
  }
}

variable "count_server" {
  type = "map"
  default = {
    "worker" = 0
    "master" = 1
    "preemptible" = 0
  }
}


variable "service_account" {
  type = string
}

variable "image_version" {
  type = string
  default = "2.0-debian10"
}


variable "staging_bucket" {
  type = string
}