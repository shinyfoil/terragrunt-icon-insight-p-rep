terraform {
  source = "../../../../../../modules/terraform-aws-icon-fluentd-aggregator-node"
}
include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../../network/vpc-services"
}

dependency "keys" {
  config_path = "../keys"
}

dependency "sg" {
  config_path = "../sg"
}

dependency "dns" {
  config_path = "../../../network/dns"
}

inputs = {
  name = "fluentd-aggregator"

  volume_dir = ""
  ebs_volume_size = 200
  root_volume_size = "20"
  instance_type = "t2.small"
  volume_path = "/dev/sdf"

  key_name = dependency.keys.outputs.key_name
  public_key = dependency.keys.outputs.public_key

  security_groups = dependency.sg.outputs.security_group_ids
  subnet_id = dependency.vpc.outputs.public_subnets[0]

  user_data_script = "user_data_ubuntu.sh"

  zone_id = dependency.dns.outputs.zone_id
  domain = "us-east-1.aws.patchnotes.xyz"

  //  TODO: Fix this
  tags = {}

}