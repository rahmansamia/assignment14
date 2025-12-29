resource "aws_lb" "app_alb" {
  name               = "webapp-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]
}
