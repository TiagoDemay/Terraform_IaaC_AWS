variable "vpc_cidr_block" {
    description = "Range of IPv4 address for the VPC."
    default     = "172.17.0.0/16"   
}



######################## Numero de instancias por ALuno #####################
variable "qd_instancias" {
  default = "3"
}
############################################################################
# variable "user_names" {
#   description = "Create IAM users with these names"
#   type        = list(string)
#   default     = ["neo.matrix", "trinity.matrix", "morpheus.matrix", "demays.matrix"]
# }

# variable "user_names" {
#   description = "Pull names from file planilha.csv"
#   default     = values(local.instances)[*].names
# }


locals {
  instances = csvdecode(file("/app/terraform/planilhaINST.csv"))
}

locals {
  iams_keys = csvdecode(file("/app/terraform/planilhaIAM.csv"))
}

variable "id_user" {
  default = "2"
}

variable "az_count" {
  default = "1"
}



variable "pgp_key" {
  default = <<EOF
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
bT6XhQ==
EOF
  
}
