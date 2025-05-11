#CHALLENGE create a file in local machine using terraform

resource "null_resource" "file" {
    provisioner "local-exec" {
      command = "echo 'Message: ${upper("hello jagadish and monith world!")}' > challenge.txt"
    }

    provisioner "local-exec" {
      command = "echo 'Message: ${upper("hello jagadish and monith world!")}' > challenge.txt"
    }
  
}