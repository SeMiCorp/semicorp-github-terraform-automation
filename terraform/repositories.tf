locals {

   checks = {
    drone = [
      "continuous-integration/drone/pr",
      "continuous-integration/drone/push"
    ]
  }

  repositories = {
    "github-terraform-automation" : {
      "checks" : ["terraform-validate"]
    },
    "demo-repo" : {
      
    }
  }
  repository_configs = {
    for k, v in local.repositories : k => {
      checks = try(v.checks, [])
    }
  }

}