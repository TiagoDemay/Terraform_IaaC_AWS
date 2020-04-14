resource "aws_key_pair" "my_key" {
    for_each   = { for inst in local.iams_keys : inst.id_user => inst }
    key_name   = "key-${each.key}"
    public_key = each.value.ssh
//    public_key = file("/root/.ssh/id_rsa.pub")
}

