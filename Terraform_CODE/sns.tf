# Create an SNS Topic
# Terraform aws create sns topic
resource "aws_sns_topic" "user_updates" {
  name = "${var.name}-sns-topic"
  tags = {
    Name          = "${var.name}-sns-topic"
    Folder        = var.folder
    Author        = var.author
    Project       = var.project
    ManagedBy     = var.managedby
    Owner         = var.owner
    Administrator = var.administrator
  }
}

# Create an sns topic subscription
# Terraform aws sns topic subscription
## # ###################################################################################### ##
## Provides a resource for subscribing to SNS topics.                                       ##
## Requires that an SNS topic exist for the subscription to attach to.                      ##
## This resource allows me to automatically place messages sent to SNS topics in SQS queues ## 
## send them as HTTP(S) POST requests to a given endpoint,                                  ##
## send SMS messages,                                                                       ##
## or notify devices / applications.                                                        ##
## The most likely use case for Terraform users will probably be SQS queues.                ##
## # ###################################################################################### ##
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = var.protocol_sns
  endpoint  = var.operator_email_sns
}
