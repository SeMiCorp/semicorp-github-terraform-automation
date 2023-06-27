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

resource "github_team" "maintainers_team" {
  name        = "maintainers"
  description = "Maintainers"
}

# data "github_team" "maintainers_team" {
#   slug = "maintainers-team"
# }

resource "github_team_repository" "maintainers_team_repos" {
  for_each   = module.repository
  team_id    = github_team.maintainers_team.id
  repository = each.value.name
  permission = "push"
}


resource "github_team_membership" "maintainers_team_membership_one" {
  team_id  = "${github_team.maintainers_team.id}"
  username = "sewerynmi"
  role     = "maintainer"
}



# resource "github_team_members" "maintainers_team_members" {
#   team_id  = github_team.maintainers_team.id
  
#   members {
#     username = "sewerynmi"
#     role     = "maintainer"
#   }
  
#   members {
#     username = "severinum"
#     role     = "member"
#   }
# }
