output "arn_user" {
  value = "${aws_iam_user.user[*]}"
}


output "ip_public" {
    description = "The Public IP address of the instances."
    value = "${join("\n", aws_instance.user1.*.public_ip)}"
}


output "name" {
  value = values(aws_iam_user.user)[*].name
}


output "password" {
  value = values(aws_iam_user_login_profile.profile)[*].encrypted_password
}




# output "this_iam_user_name" {
#   description = "The user's name"
#   value       = aws_iam_user.user.name
# }
