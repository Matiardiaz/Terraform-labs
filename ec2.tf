# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  # ami                         = "ami-087c17d1fe0178315"
  ami                         = "ami-064e65efdd62efb36"
  instance_type               = "t3.micro"
  # count                       = 1
  key_name = aws_key_pair.generated_key.key_name
  #key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My-Public-Instance"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demoinstance1" {
  # ami                         = "ami-087c17d1fe0178315"
  ami                         = "ami-064e65efdd62efb36"
  instance_type               = "t3.micro"
  # count                       = 1
  key_name = aws_key_pair.generated_key.key_name
  # key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-2.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My-Public-Instance 2"
  }
}
