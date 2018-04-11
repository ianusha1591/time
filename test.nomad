job "docs" {
 datacenters = ["dc1"]

  # Only run this job where the qemu version is higher than 1.2.3.
  constraint {
    attribute = "${driver.qemu.version}"
    operator  = "<"
    value     = "1"
  }
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
}
}







