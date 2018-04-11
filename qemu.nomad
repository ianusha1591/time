job "qemu" {


  datacenters = ["dc1"]

  group "cache" {





task "qemu" {

  driver = "qemu"

  config {
    image_path        = "/root/ubuntu.img"
    accelerator       = "tcg"
    graceful_shutdown = true
    args              = ["-nodefaults", "-nodefconfig"]
 

 port_map {
    db = 6539
  }


  }
artifact {
    source = "http://old-releases.ubuntu.com/releases/15.04/ubuntu-15.04-server-amd64.iso"
}
}
}
}  
