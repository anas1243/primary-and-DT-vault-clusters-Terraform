resource "aws_instance" "vault_vms_primary01" {
  ami                    = var.vms_ami_us-east-1
  subnet_id              = module.network.private_subnet1_id
  instance_type          = var.vms_machine_type
  key_name               = var.vms_key_name
  vpc_security_group_ids = [aws_security_group.vault_vms_sg.id]
  user_data = file("user_data/vault_user_data_primary.sh")
  iam_instance_profile = aws_iam_instance_profile.vault_vms_iam_instance_profile.name

tags = {
  Name = "vault-primary01"
  vault = "primary-cluster"
}
}

resource "aws_instance" "vault_vms_primary02" {
  ami                    = var.vms_ami_us-east-1
  subnet_id              = module.network.private_subnet2_id
  instance_type          = var.vms_machine_type
  key_name               = var.vms_key_name
  vpc_security_group_ids = [aws_security_group.vault_vms_sg.id]
  user_data = file("user_data/vault_user_data_primary.sh")
  iam_instance_profile = aws_iam_instance_profile.vault_vms_iam_instance_profile.name

tags = {
  Name = "vault-primary02"
  vault = "primary-cluster"
}
}

resource "aws_instance" "vault_vms_primary03" {
  ami                    = var.vms_ami_us-east-1
  subnet_id              = module.network.private_subnet1_id
  instance_type          = var.vms_machine_type
  key_name               = var.vms_key_name
  vpc_security_group_ids = [aws_security_group.vault_vms_sg.id]
  user_data = file("user_data/vault_user_data_primary.sh")
  iam_instance_profile = aws_iam_instance_profile.vault_vms_iam_instance_profile.name

tags = {
  Name = "vault-primary03"
  vault = "primary-cluster"
}
}

resource "aws_instance" "vault_vms_bastion" {
  ami                    = var.vms_ami_us-east-1
  subnet_id              = module.network.public_subnet1_id
  instance_type          = var.vms_machine_type
  key_name               = var.vms_key_name
  vpc_security_group_ids = [aws_security_group.vault_vms_sg.id]
  user_data = file("user_data/vault_user_data_bastion.sh")
  iam_instance_profile = aws_iam_instance_profile.vault_vms_iam_instance_profile.name

tags = {
  Name = "vault-bastion"
  vault = "primary-bastion"
}
}