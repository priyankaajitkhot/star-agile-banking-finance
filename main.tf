provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "my_ec2_instance" { 
 ami = "ami-0261755bbcb8c4a84" 
 instance_type = "t2.medium" 
 key_name = "devops" 
  
 tags ={ 
 name="Production_server" 
} 
   user_data = <<-EOF
    #!/bin/bash
       sudo apt-get update -y
       sudo apt install docker.io -y
       sudo systemctl enable docker
       sudo docker run -itd -p 8090:8081 priyankaajitkhot/mycontainer:latest
       sudo docker start $(docker ps -aq)
    
  EOF
}
