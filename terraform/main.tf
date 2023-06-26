provider "github" {
  # owner = Set using env.vars. - taken from GITHUB_OWNER
  # token = 
}

data "github_team" "semicorpadmins" {
  slug = "semicorpadmins"
}

resource "github_repository" "example-repo" {
  name        = "example-repo"
  description = "My new repository for use with Terraform"
}
