data "github_repository" "default" {
  name = var.name
}

resource "github_branch_protection_v3" "main" {
  lifecycle {
    ignore_changes = [
      required_pull_request_reviews[0].required_approving_review_count
    ]
  }
  repository = data.github_repository.default.name

  branch = "main"
  require_conversation_resolution = true

  required_status_checks {
    strict   = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }

}