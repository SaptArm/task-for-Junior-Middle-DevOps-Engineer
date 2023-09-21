resource "null_resource" "docker-swarm-manager" {
  depends_on = [yandex_compute_instance.vm-manager]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.vm-manager[count.index].network_interface.0.nat_ip_address
  }

  provisioner "file" {
    source      = "~/microservices/DEVOPS-Kubernates-microservices-demo/deploy/docker-compose/docker-compose.yml"
    destination = "docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com | sh",
      "sudo usermod -aG docker $USER",
      "sudo apt install -y docker-compose",
      "sudo docker swarm init",
      "sleep 10",
      "echo COMPLETED"
    ]
  }
}