variable "ami_version_pattern" {
  type        = string
  default     = "\\d.\\d.\\d"
  description = "The pattern to match AMI version to"
}

variable "environment" {
  type        = string
  description = "The environment name to be used when creating AWS resources"
}

variable "instance_hostname" {
  type        = string
  description = "The hostname to set for the instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "The instance type to use"
}

variable "lvm_block_devices" {
  type = list(object({
    aws_volume_size_gb: string,
    filesystem_resize_tool: string,
    lvm_logical_volume_device_node: string,
    lvm_physical_volume_device_node: string,
  }))
  description = "A list of objects representing LVM block devices; each LVM volume group is assumed to contain a single physical volume and each logical volume is assumed to belong to a single volume group; the filesystem for each logical volume will be expanded to use all available space within the volume group using the filesystem resize tool specified; block device configuration applies only on resource creation"
}

variable "region" {
  type        = string
  description = "The AWS region in which resources will be administered"
}

variable "root_volume_size" {
  type        = number
  default     = 0
  description = "The size of the root volume in GiB; set this value to 0 to preserve the size specified in the AMI metadata. This value should not be smaller than the size specified in the AMI metadata and used by the root volume snapshot. The filesystem will be expanded automatically to use all available space for the volume and an XFS filesystem is assumed"
}

variable "service" {
  type        = string
  default     = "elasticsearch"
  description = "The service name to be used when creating AWS resources"
}

variable "ssh_keyname" {
  type        = string
  description = "The SSH keypair name to use for remote connectivity"
}
