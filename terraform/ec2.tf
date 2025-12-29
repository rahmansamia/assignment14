resource "aws_iam_role" "ssm_role" {
  name = "webapp-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_instance" "k8s_node" {
  ami                  = "ami-0abcdef12345"
  instance_type        = "t3.medium"
  subnet_id            = aws_subnet.private.id
  key_name             = "totest"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  user_data            = file("${path.module}/userdata.sh")
}
