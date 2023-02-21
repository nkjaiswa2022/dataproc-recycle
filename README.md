#  Dataproc Cluster Recycle

This repository is to perofrm dataproc cluster recycle operation

## Technologies

This repository aims to deploy a Dataproc Cluster using these technologies:

* Terraform
* Cloud Build (need to enable API)
* Github (GitOps)

## Workflow 

The workflow is the following:
```bash
Link GitHub Repository with a GCP Project -> Develop code (Terraform .tf) -> Write a Step (cloudbuild.yaml) -> Push code (Github) 'prod' branch-> Automatic deployment
```

## Architecture
To use this project please go to `terraform.tfvars` and change with your own values.

## Steps

To achive the architecture the steps configured in `cloudbuild.yaml` are:

```bash
step 1: Shows Branch
step 2: Terraform init
step 3: Terraform Plan
step 4: Terraform Deploy
```
All the steps run in about 8 minutes.

