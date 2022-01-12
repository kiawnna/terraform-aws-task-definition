variable "environment" {
  type = string
}
variable "app_name" {
  type = string
}
variable "task_role_arn" {
  type = string
}
variable "task_execution_role_arn" {
  type = string
}
//variable "volumes" {
//  type = list(object({}))
//}
variable "container_definitions" {
  type = string
}
variable "network_mode" {
  type = string
  default = "awsvpc"
}