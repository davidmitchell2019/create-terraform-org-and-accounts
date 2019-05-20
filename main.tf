provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.default_region}"
}
//organization stuffs
resource "aws_organizations_organization" "GFT" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.comterraofrm "
  ]
  feature_set = "ALL"
}
resource "aws_organizations_account" "prod" {
  name  = "prod"
  email = "${var.prod_email}"
  depends_on = ["aws_organizations_organization.GFT"]
}
resource "aws_organizations_account" "shared-services" {
  name  = "shared-services"
  email = "${var.shared_service_email}"
  depends_on = ["aws_organizations_organization.GFT"]
}
