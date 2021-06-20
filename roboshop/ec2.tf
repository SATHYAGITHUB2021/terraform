module "frontend" {
  source     = "./ec2"
  COMPONENTS = var.COMPONENTS
}