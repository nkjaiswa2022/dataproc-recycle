# Terraform configuration goes here
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

####################################################################################
# Dataproc Cluster
####################################################################################
# Build Nodes
resource "google_dataproc_cluster" "mydataproc" {
  name     = "ctrma-dp-cluster"
  region   = var.region
  labels = {
    foo = "bar"
  }

  cluster_config {
    staging_bucket = var.staging_bucket

    master_config {
      num_instances = var.count_server["master"]
      machine_type  = var.machine_types["master"]
      disk_config {
        boot_disk_type    = var.disk_type["master"]
        boot_disk_size_gb = var.disk_size["master"]
      }
    }

    worker_config {
      num_instances    = var.count_server["worker"]
      machine_type     = var.machine_types["worker"]
      disk_config {
        boot_disk_type    = var.disk_type["worker"]
        boot_disk_size_gb = var.disk_size["worker"]
      }
    }

    preemptible_worker_config {
      num_instances = var.count_server["preemptible"]
    }

    # Override or set some custom properties
    software_config {
      image_version = var.image_version
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      tags = ["foo", "bar"]
      service_account_scopes = [
       "https://www.googleapis.com/auth/cloud-platform"
      ]
      network    = "default"
      internal_ip_only = true
      #network    = google_compute_network.dataproc_network.name
      #service_account = var.service_account #optional if you want to choose a service account
    }

    # You can define multiple initialization_action blocks
    /*initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }*/
  }
}
