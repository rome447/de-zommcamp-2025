variable "bq_dataset_name" {
  description = "demo dataset"
  default = "demo_dataset"
}

variable "gsc_bucket_name" {
  description = "demo bucket"
  default = "ny-taxi-449004-terra-bucket"
}

variable "location" {
  description = "project location"
  default = "US"
}

variable "credentials" {
  description = "GCS api key path"
  default = "../keys/terraform_key.json"
}