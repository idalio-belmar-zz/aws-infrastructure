# Variables Configuration

variable "cluster-name" {
  default     = "eks-cluster-poc"
  type        = string
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list
  description = "The AWS AZ to deploy EKS"
}

variable "k8s-version" {
  default     = "1.14"
  type        = string
  description = "Required K8s version"
}

variable "kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the node kubelet process"
}

variable "public-kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the public node kubelet process"

}

variable "vpc-subnet-cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The VPC Subnet CIDR"
}

variable "private-subnet-cidr" {
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  type        = list
  description = "Public Subnet CIDR"
}

variable "db-subnet-cidr" {
  default     = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  type        = list
  description = "DB/Spare Subnet CIDR"
}

variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  default     = "m4.large"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "root-block-size" {
  default     = "20"
  type        = string
  description = "Size of the root EBS block device"

}

variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "public-min-size" {
  default     = 1
  type        = string
  description = "Public Node groups min ASG capacity"
}

variable "public-max-size" {
  default     = 1
  type        = string
  description = "Public Node groups max ASG capacity"
}

variable "public-desired-capacity" {
  default     = 1
  type        = string
  description = "Public Node groups desired ASG capacity"
}

variable "ec2-key-public-key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA2X1bJAG++xYeZ9dLghF39wYZTxqhdNGFTZts6JOQ5gw39MWoqS08f7dYsa9I57g+kjfzeCbpkmyG5A+l8R9THz94XirmKj+ysokbZxkmvIfj4px9TiIKUaqFFzXWZZCkmfOPUWzbdNNvrcMF8Xx1k2wc1l29KAr1EbzKElMO6wVt91KWTihgA06dZlZdFdgbjReTHmpvgvTOylKswyp61C3X8gYOxplxVO1LMeTyPpeLYPAkkkOqSTmER5uH+VKQHYab3e9ptIoARZxt46ByUu2tf9m1m7f9Ujz4SHEcbq4naybvTQd/x9eFJ1My53/tSz/qpmqF4jv0wgvYvsLFV7EFgdTnyTMkWlitNSfnE4uNq1oZ8Jrjwm5taCs94ptowSiFn9D5AT2iskFoJfiTbx8n3d5SFKFbDu74oAJslXLGO5Q2jNqIoQZkQhWL15PgpxkWzD5Jnr0u0nCujT3G3MEyA+O3lhTfdy6HJ9QuyIlB6t16Y6wW5WItcd4EIWc= IDALIO BELMAR@IBELMAR-NTB"
  type        = string
  description = "AWS EC2 public key data"
}
