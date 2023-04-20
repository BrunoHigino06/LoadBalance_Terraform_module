#Load balance resource
resource "aws_lb" "load_balancer" {
  name               = var.load_balancer.name
  internal           = var.load_balancer.internal
  load_balancer_type = var.load_balancer.load_balancer_type

  subnet_mapping {
    subnet_id = var.load_balancer.subnet_id
  }

  listener {
    protocol = var.load_balancer.protocol
    port     = var.load_balancer.port

    default_action {
      type = var.load_balancer.action_type

      target_group_arn = aws_lb_target_group.target_group.arn
    }
  }
}

#Target group resource
resource "aws_lb_target_group" "target_group" {
  name_prefix = var.load_balancer.target_group_prefix
  port        = var.load_balancer.port
  protocol    = var.load_balancer.protocol
  vpc_id      = var.load_balancer.vpc_id

  health_check {
    path                = var.load_balancer.health_check_path
    protocol            = var.load_balancer.protocol
    timeout             = 5
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
