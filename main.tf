// Task definition for application.
resource "aws_ecs_task_definition" "ecs-task-definition" {
//  count = var.deploy_task_definition == true ? 1 : 0
  family             = "${var.app_name}-${var.environment}-task-def"
  task_role_arn      = var.task_role_arn
  execution_role_arn = var.task_execution_role_arn
  network_mode             = var.network_mode

// dynamic "volume" {
//  for_each = var.volumes == [] ? null : var.volumes
//  content {
//    name = volume.value.name
//
//    dynamic "fsx_windows_file_server_volume_configuration" {
//      for_each = volume.value.fsx_windows_file_server_volume_configuration
//      content {
//        file_system_id = fsx_windows_file_server_volume_configuration.value.file_system_id
//        root_directory       = fsx_windows_file_server_volume_configuration.value.root_directory
//
//        dynamic "authorization_config" {
//          for_each = fsx_windows_file_server_volume_configuration.value.authorization_config
//          content {
//            credentials_parameter  = authorization_config.value.credentials_parameter
//            domain                 = authorization_config.value.domain
//          }
//        }
//      }
//    }
//  }
//}

  tags = {
    Name = "${var.app_name}-${var.environment}-task-def"
    Deployment_Method = "terraform"
    Environment = var.environment
  }

  container_definitions = var.container_definitions
}