output "repositories" {
  value = data.github_team.callisto.repositories
}


output "unconfigured_team_repositories" {
  value = setsubtract(data.github_team.callisto.repositories, [for k, v in local.repository_configs : k])
}