resource "aws_instance" "airbyte-staging-ec2" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = var.subnet_private

  vpc_security_group_ids = [

    var.security_group1,
    var.security_group2

  ]

  ebs_block_device {

    delete_on_termination = var.delete_on_termination
    device_name           = var.ebs_device_name
    volume_size           = var.volume_size

  }

  associate_public_ip_address = var.associate_public_ip_address

  tags = {

    Name = var.instance_name

  }

  user_data = <<EOF
#!/bin/bash
  
sudo yum update

sudo yum search docker

sudo yum info docker

sudo yum -y install docker

sudo usermod -a -G docker ec2-user
id ec2-user

newgrp docker

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service

sudo systemctl start docker.service

mkdir airbyte && cd airbyte

wget https://raw.githubusercontent.com/airbytehq/airbyte/master/.env && wget https://raw.githubusercontent.com/airbytehq/airbyte/master/docker-compose.yaml && wget https://raw.githubusercontent.com/airbytehq/airbyte/master/flags.yml

docker-compose up -d
EOF

}