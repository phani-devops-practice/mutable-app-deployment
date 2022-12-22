resource "null_resource" "cluster" {
  triggers = {
    abc = timestamp()
  }
  count       = ""
  provisioner "remote-exec" {
    connection {
      user     = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_USER"]
      password = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_PASS"]
      host     = ""
      
    inline = [
      "ansible-pull -U https://github.com/phani-devops-practice/TRN-roboshop-ansilble.git roboshop.yml -e HOST=localhost -e ROLE=${var.COMPONENT} -e ENV=${var.ENV} -e DOCDB_ENDPOINT=${var.DOCDB_ENDPOINT} -e REDIS_ENDPOINT=${var.REDIS_ENDPOINT} -e MYSQL_ENDPOINT=${var.MYSQL_ENDPOINT}",
    ]
  }
}