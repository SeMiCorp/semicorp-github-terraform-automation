output "repositories" {
  value = data.github_team.semicorp_admins.repositories
}


output "unconfigured_team_repositories" {
  value = setsubtract(data.github_team.semicorp_admins.repositories, [for k, v in local.repository_configs : k])
}