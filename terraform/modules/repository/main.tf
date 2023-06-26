data "github_repository" "default" {
  name = var.name
}

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }