job "blue" {


  datacenters = ["dc1"]


  type = "service"




  update {

    max_parallel = 1


    min_healthy_time = "1s"


    healthy_deadline = "3m"


    auto_revert = true



    canary = 1
  }
 #migrate {

  #  max_parallel = 1


   # health_check = "checks"


    #min_healthy_time = "10s"


  #  healthy_deadline = "5m"
  #}



  group "cache" {

    count = 2


    restart {

      attempts = 2
      interval = "30m"


      delay = "15s"
mode = "fail"
    }


    ephemeral_disk {

      size = 300
    }


    task "nigelpoulton" {

      driver = "docker"

config {
#       image = "nigelpoulton/pluralsight-docker-ci"
       image = "nigelpoulton/pluralsight-docker-ci:edge"
        image = "nigelpoulton/pluralsight-docker-ci"

        port_map {
          http = 8080
        }
      }

    resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10

         port "http" {}
               }
      }


      service {
        name = "nigelpoulton"
        tags = ["global", "cache"]

       port = "http"

 #       check {
  #        name     = "alive"
   #  type     = "tcp"
    #     interval = "10s"
     #     timeout  = "2s"
      #  }
      }


    }
  }
}

