provider "github" {
  # owner = Set using env.vars. - taken from GITHUB_OWNER
  # token = 
}

data "github_team" "semicorp_admins" {
  slug = "semicorpadmins"
}



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
