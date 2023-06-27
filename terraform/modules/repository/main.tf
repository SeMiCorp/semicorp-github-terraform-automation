data "github_repository" "default" {
  name = var.name
}

resource "github_branch_protection" "main" {
  lifecycle {
    ignore_changes = [
      required_pull_request_reviews[0].required_approving_review_count
    ]
  }
  repository = data.github_repository.default.name

  pattern = "main"
  require_conversation_resolution = true
  required_linear_history         = true
  enforce_admins                  = true
  allows_deletions                = false
  allows_force_pushes             = false

  required_status_checks {
    strict   = true
    contexts = null
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }

}