job "vm" {


  datacenters = ["dc1"]

  group "cache" {





task "vm" {
#count = 2
  driver = "qemu"

  config {
    image_path        = "/root/ubuntu.img"
    accelerator       = "tcg"
    graceful_shutdown = true
    args              = ["-nodefaults", "-nodefconfig"]
 #    image = "nigelpoulton/pluralsight-docker-ci"

 port_map {
    db = 6539
  }


  }
}
#constraint {
 #   attribute = "${driver.qemu.version}"
 #   operator  = ">"
  #  value     = "1.2.3"
#  }
}
}  
