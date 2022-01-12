# terraform-aws-task-definition

## Instantiation
The simplest instantiation requires only an environment, app_name, task_role_arn, task_execution_role_arn and container_definitions.

```
module "task_definition" {
  source = "git@github.com:kiawnna/terraform-aws-task-definition.git"

  app_name = each.value.app_name
  container_definitions = <<-EOF
[
  {
    "name": "container",
    "image": "container image",
    "memory": 512,
    "cpu": 256,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080
      }
    ]
  }
]
EOF
  environment = "dev"
  task_execution_role_arn = "task execution role arn"
  task_role_arn = "task role arn"
}
```
> This example will create an ECS task definition that accepts all the provided defaults. Review defaults below under Variables / Customizations.

## Resources Created
* A task definition to use with an ECS service.

## Outputs
The task definition arn is an output.

Refer to this output as:
> module.task_definition_module_name.task_definition_arn

## Variables / Customization
The variable below can be customized to fit your needs. The current defaults are:
>  * `network_mode` &rarr; awsvpc
>  * `health_check_grace_period` &rarr; 120
>  * `network_mode` &rarr; awsvpc

See the `variables.tf` file for further information.

## Tags
Tags are automatically added to all resources where possible. Tags will have the following format:

```
tags = {
    Name = "${var.app_name}-${var.environment}-task-def"
    Deployment_Method = "terraform"
    Environment = var.environment
  }
```

