# --- AWS Secrets Manager ---
resource "aws_secretsmanager_secret" "app_secrets" {
  name                    = "deploy-stack-svelte-example-secrets"
  description             = "Environment variables for deploy-stack-svelte-example"
  recovery_window_in_days = 0 # Allows instant deletion for dev/POC environments
}

# Initial placeholder secret so the ECS task doesn't fail on first boot
resource "aws_secretsmanager_secret_version" "app_secrets_initial" {
  secret_id = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    EXAMPLE_API_KEY = "replace_me_in_aws_console_or_cli"
  })

  lifecycle {
    ignore_changes = [secret_string]
  }
}
