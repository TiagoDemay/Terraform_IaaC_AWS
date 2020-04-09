
resource "aws_cloudwatch_metric_alarm" "foobar" {
  for_each = { for inst in local.instances : inst.id_group => inst }
//  count                = length(local.instances)
  alarm_name           = "StopMachine-${element(values(aws_instance.inst)[*].id, each.key)}"
  namespace            = "AWS/EC2"
  evaluation_periods   = "5"
  period               = "1200"
  alarm_description    = "This metric Stop unsed EC2 instances"
  alarm_actions        = ["arn:aws:automate:us-east-2:ec2:stop"]
  statistic            = "Average"
  comparison_operator  = "LessThanOrEqualToThreshold"
  threshold            = "0.35"
  metric_name          = "CPUUtilization"

  dimensions = {
    InstanceId = element(values(aws_instance.inst)[*].id, each.key)             
  }
} 