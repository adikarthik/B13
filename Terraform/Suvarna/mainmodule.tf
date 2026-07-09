module "dev_file" {

  source = "./modules/"

  filename = "dev.txt"

  content = "Development Environment"

}

module "qa_file" {

  source = "./modules/"

  filename = "qa.txt"

  content = "QA Environment"

}

module "prod_file" {

  source = "./modules/"

  filename = "prod.txt"

  content = "Production Environment"

}

module "GitHub" {
  source   = "github.com/adikarthik/Terraform.git"
  f1 = "GitHub.txt"
  
}

