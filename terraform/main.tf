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

data "github_team" "maintainers_team" {
  slug = "maintainers-team"
}

resource "github_team_repository" "maintainers_team_repos" {
  for_each   = module.repository
  team_id    = data.github_team.maintainers_team.id
  repository = each.value.name
  permission = "push"
}

resource "github_team_membership" "maintainers-team-membership-sewerymi" {
  team_id  = data.github_team.maintainers_team.id
  username = "sewerynmi"
  role     = "member"
}

resource "github_team_membership" "maintainers-team-membership-severinum" {
  team_id  = data.github_team.maintainers_team.id
  username = "severinum"
  role     = "member"
}

resource "github_team_membership" "maintainers-team-membership-SewerynMi01" {
  team_id  = data.github_team.maintainers_team.id
  username = "SewerynMi01"
  role     = "member"
}
