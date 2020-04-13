data "aws_availability_zones" "available" {}

data "aws_iam_policy" "StartI" {
    arn = "arn:aws:iam::090634953621:policy/EC2StartStopOwnInstances"
}

data "aws_iam_policy" "ChangePass" {
    arn = "arn:aws:iam::090634953621:policy/IAM_ACCESS_terraform"  
}

data "aws_instances" "data" {
  filter {
    name   = "tag:Name"
    values = ["*"]
  }

  instance_state_names = ["running", "stopped"]
}

