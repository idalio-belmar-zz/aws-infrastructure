### VPC

# use terraform cloud remote backend OR you can use your prefered remote backend

terraform {
  backend "remote" {
    organization = "falabella"
    workspaces {
      name = "my-workspace"
    }
  }
}


module "eks" {
  source = "../modules/eks"

  aws-region              = "us-east-1"
  availability-zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cluster-name            = "eks-cluster-poc"
  k8s-version             = "1.14"
  node-instance-type      = "t2.micro"
  desired-capacity        = 3
  max-size                = 5
  min-size                = 1
  public-min-size         = 1
  public-max-size         = 5
  public-desired-capacity = 3
  vpc-subnet-cidr         = "10.0.0.0/16"
  private-subnet-cidr     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  public-subnet-cidr      = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  db-subnet-cidr          = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  eks-cw-logging          = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  ec2-key-public-key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA2X1bJAG++xYeZ9dLghF39wYZTxqhdNGFTZts6JOQ5gw39MWoqS08f7dYsa9I57g+kjfzeCbpkmyG5A+l8R9THz94XirmKj+ysokbZxkmvIfj4px9TiIKUaqFFzXWZZCkmfOPUWzbdNNvrcMF8Xx1k2wc1l29KAr1EbzKElMO6wVt91KWTihgA06dZlZdFdgbjReTHmpvgvTOylKswyp61C3X8gYOxplxVO1LMeTyPpeLYPAkkkOqSTmER5uH+VKQHYab3e9ptIoARZxt46ByUu2tf9m1m7f9Ujz4SHEcbq4naybvTQd/x9eFJ1My53/tSz/qpmqF4jv0wgvYvsLFV7EFgdTnyTMkWlitNSfnE4uNq1oZ8Jrjwm5taCs94ptowSiFn9D5AT2iskFoJfiTbx8n3d5SFKFbDu74oAJslXLGO5Q2jNqIoQZkQhWL15PgpxkWzD5Jnr0u0nCujT3G3MEyA+O3lhTfdy6HJ9QuyIlB6t16Y6wW5WItcd4EIWc= IDALIO BELMAR@IBELMAR-NTB"
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "config-map" {
  value = module.eks.config-map-aws-auth
}
