
# output "arn_user" {
#     value = values(aws_iam_user.user)[*].arn
# }

# output "ip_public" {
#     description = "The Public IP address of the instances."
#     value = "${join("\n", values(aws_instance.inst)[*].public_ip)}"
# }

# output "password" {
#     sensitive = true
#     value     = values(aws_iam_user_login_profile.profile)[*].encrypted_password
# }

# output "AlarmesNames" {
#     value = values(aws_instance.inst)[*].id
# }


# output "DimensionsId" {
#     value = values(aws_cloudwatch_metric_alarm.foobar)[*].dimensions.InstanceId
# }


# output "dataID" {
#     value = data.aws_instances.data
# }


# output "this_iam_user_name" {
#     description = "The user's name"
#     value       = aws_iam_user.user.name
# }
