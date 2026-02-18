locals {
  ssh_public_key = "ubuntu:${file(pathexpand(var.ssh_key_path))}"
}