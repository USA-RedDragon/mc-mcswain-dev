data "aws_iam_policy_document" "ecs-agent" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs-agent" {
  name               = "${local.name}-ecs-agent"
  assume_role_policy = data.aws_iam_policy_document.ecs-agent.json
}

resource "aws_iam_role_policy_attachment" "ecs-agent" {
  role       = aws_iam_role.ecs-agent.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ecs-agent.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ecs-agent" {
  name = "${local.name}-ecs-agent"
  role = aws_iam_role.ecs-agent.name
}
