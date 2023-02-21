# Variable values go here


#Enter your project ID
project = "ihg-poc-362312"

#Staging bucket, used used to stage files, such as Hadoop jars, between client machines and the cluster.
staging_bucket = "dataproc-staging-us-central1-784624916862-soeut05t"

#Enter your region
region = "us-central1"

# replace with n1-standard-1 if you only want to test
machine_types = {
  "master" = "c2-standard-30"
  "worker" = "c2-standard-30"
}


# replace with a service account you want to be used in the VMs to be created
# leave in blank if you want to use a new service account
service_account = "784624916862-compute@developer.gserviceaccount.com"

