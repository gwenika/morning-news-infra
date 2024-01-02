terraform {
  cloud {
    organization = "ducktyping-org"

    workspaces {
      name = "mn-infra"
    }
  }
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.7.1"
    }
  }
}

//Use the Linode Provider
provider "linode" {
}

resource "linode_sshkey" "linode" {
  label = "linode"
  ssh_key = chomp(file("/home/xwenn/linode-ssh/linode.pub"))
}

resource "linode_instance" "server" {
  label           = "app_server"
  image           = "linode/ubuntu22.04"
  region          = "fr-par"
  type            = "g6-standard-1"
  authorized_keys = [linode_sshkey.linode.ssh_key]
  root_pass       = "~MK+wiL6PE*&^u&"

  swap_size  = 256
  private_ip = true
}