#Load balance variable
variable "load_balancer" {
    type = map(any)
        default = {
            name  = ""
            internal = ""
            load_balancer_type = "gateway"
            subnet_id = ""
            action_type = "forward"
            protocol = ""
            port = ""
            target_group_prefix = ""
            health_check_path = "/"
        }
    description = "Load balance variables"
}