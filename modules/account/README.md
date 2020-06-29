# ACME Account

This submodule creates an ACME account which may be used to register multiple ACME certificates.

## Usage

Example using dnsimple.com as dns challenge provider:

```hcl
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

module "acme_account" {
  source  = "nephosolutions/certificate/acme//modules/account"
  version = "2.0.0"

  email_address = "info@example.com"
}
```

The ACME provider's `server_url` can be set to `https://acme-staging-v02.api.letsencrypt.org/directory` for staging.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| acme | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| email\_address | The contact email address for the account. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ACME account ID |
| private\_key | The ACME account private key |
| registration\_url | The ACME account registration URL |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
