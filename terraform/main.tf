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

resource "linode_instance" "server" {
  label           = "app_server"
  image           = "linode/ubuntu22.04"
  region          = "fr-par"
  type            = "g6-standard-1"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCQqF5UveLYcq+MIQ84/j59bpqWewHzetTX1+Au/Vn3dCeOTX7kp+sm7n5yyJjEPK+O934khon1qzvdQZduztGgB0qRzXtUxyfWfbnCP8PvTYEg0qps+xsqqbCb9cjJ9kspZg1giyxLVXPPyQkbzFOjgdUkmrTFBMxfd1g14OYtZo+Gsd2nJpVNP68AsSQxVqzzmpZWU7UVu/kCHO+krFUPBsfoH5XJsIEid0dt12p1c1lJOrITx+dofVpLwvXoj8vpRSlJHrgKy94hGtWPPVCHw19s6sYG33ppykWVxBIN72wWUs9uMjSr8hbca1jy0rhfACRa+M6+Kp799Pp7uYqx4h6NPP2QSvm4aZRkPVrvz6aOZYAruhrKPvFI1aVeOxi1k9g9ABgF7LmpeBgbmUIgZgeCpnN6vBEilQrBozVbORugVId5QV2MCSkAMI3VmgVSs6nrrEht+OrlziYXoMNAKISVPp7SenwUrQsyeGtVg0cYqYx1ha44tnbrbWPmJd8= xwenn@Chirashi"]
  root_pass       = "~MK+wiL6PE*&^u&"

  swap_size  = 256
  private_ip = true
}