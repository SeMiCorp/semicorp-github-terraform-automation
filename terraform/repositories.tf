locals {
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