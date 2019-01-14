# ACME Account

This submodule creates an ACME account which may be used to register multiple ACME certificates.

## Usage

Example using dnsimple.com as dns challenge provider:

```hcl
module "acme_account" {
  source  = "nephosolutions/certificate/acme//modules/account"
  version = "0.1.0"

  email_address = "info@example.com"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| email\_address | The contact email address for the account. | string | - | yes |
| server\_url | The Let's Encrypt server URL to use; defaults to production but can be set to 'https://acme-staging.api.letsencrypt.org/directory' for staging. | string | `https://acme-v02.api.letsencrypt.org/directory` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | - |
| private\_key | - |
| registration\_url | - |