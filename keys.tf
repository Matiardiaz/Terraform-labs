## Creacion y manejo de claves para EC2
## Obvio que NO ES BUENA PRACTICA, SOLO TESTING

#Variable Declaration
variable "public_key" {
  type = string
  default  = "SHA256:ebsaciO51tTUdsWd325QC08xwWH4GGwzk9VGWCcDLMI matias@fedora"
}

#Variable Declaration
variable "key_pair_name" {
  type = string
  default  = "demokeypair"
}

#Resource to Create Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}


