output "arn_user" {
  value = "${aws_iam_user.user.arn}"
}


output "ip_public" {
    description = "The Public IP address of the instances."
    value = "${join("\n", aws_instance.user1.*.public_ip)}"
}



# output "password" {
#   value = "${aws_iam_user_login_profile.profile.encrypted_password}"
# }

# output "this_iam_user_name" {
#   description = "The user's name"
#   value       = aws_iam_user.user.name
# }

# output "this_iam_user_unique_id" {
#   description = "The unique ID assigned by AWS"
#   value       = aws_iam_user.user.unique_id
# }
