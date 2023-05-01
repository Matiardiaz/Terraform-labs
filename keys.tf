## Creacion y manejo de claves para EC2

resource "aws_key_pair" "TF-key" {
  key_name   = "TF-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

#Crear la public key para llamarla arriba. Genera par publico y privado

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Guardamos la clave localmente
resource "local_file" "TF-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
    # file_permission = "0400"
}


# #Variable Declaration
# variable "public_key" {
#   type = string
#   default  = "SHA256:KiWxWMTEF0ekWUo1Brr7fdFzV1hfCWCFXwzoO4OzOyU matias@fedora"
# }

# #Variable Declaration
# variable "key_pair_name" {
#   type = string
#   default  = "demokeypair"
# }

# #Resource to Create Key Pair
# resource "aws_key_pair" "generated_key" {
#   key_name   = var.key_pair_name
#   public_key = var.public_key
# }


