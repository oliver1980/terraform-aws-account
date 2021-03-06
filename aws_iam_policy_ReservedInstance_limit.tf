resource "aws_iam_policy" "deny_expensive_RI_instances" {
  count       = var.create_reserved_instances_limit_policy
  name        = var.create_reserved_instances_limit_policy_name
  description = "Policy to limit Reserved Instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
          {
            "Effect": "Deny",
            "Action": ["ec2:ModifyReservedInstances", "ec2:PurchaseReservedInstancesOffering"],
            "Resource": "*"
        }
    ]
}
EOF

}

