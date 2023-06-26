provider "github" {
  # owner = Set using env.vars. - taken from GITHUB_OWNER
  # token = also taken from env.vars (check withub workflow; token added as org.secret)
}

data "github_team" "semicorp_admins" {
  slug = "semicorpadmins"
}

module "repository" {
    source = "./modules/repository"
    for_each = local.repository_configs

    name   = each.key
    config = each.value
}

resource "github_team_repository" "semicorp_repos" {
  for_each   = module.repository
  team_id    = data.github_team.semicorp_admins.id
  repository = each.value.name
  permission = "admin"
}

data "github_team" "maintainers-team" {
  name        = "maintainers-team"
  description = "Maintainers-team created with Terraform"
  privacy     = "closed"
}

resource "github_team_repository" "maintainers_team_repos" {
  for_each   = module.repository
  team_id    = data.github_team.maintainers-team.id
  repository = each.value.name
  permission = "write"
}

# resource "github_team_membership" "maintainers-team-membership" {
#   team_id  = "${github_team.maintainers-team.id}"
#   username = "sewerynmi"
#   role     = "member"
# }


# resource "github_team_repository" "automation_repo_team" {
#   team_id    = "${github_team.maintainers-team.id}"
#   repository = "github-terraform-automation"
#   permission = "push"
# }

















# Create repository
# resource "github_repository" "example-repo" {
#   name        = "example-repo"
#   description = "My new repository for use with Terraform"
# }



# Create example team
# resource "github_team" "example-team" {
#   name        = "example-team"
#   description = "My new team for use with Terraform"
#   privacy     = "closed"
# }


# Add user to the team
# resource "github_team_membership" "example-team-membership" {
#   team_id  = "${github_team.example-team.id}"
#   username = "severinum"
#   role     = "member"
# }

# Add Team to Repo
# resource "github_team_repository" "example-team-repo" {
#   team_id    = "${github_team.example-team.id}"
#   repository = "${github_repository.example-repo.name}"
#   permission = "push"
# }


# Add some isse labels colours
# variable "issue_labels" {
#   default = {
#     "custom-label"  = "533D99"
#     "documentation" = "FFB340"
#     "waiting-reply" = "CC6A14"
#   }
# }

# Add issues labels
#   resource "github_issue_label" "test_repo" {
#   repository = "${github_repository.example-repo.id}"
#   count      = "${length(var.issue_labels)}"
#   name       = "${element(keys(var.issue_labels), count.index)}"
#   color      = "${element(values(var.issue_labels), count.index)}"
# }
