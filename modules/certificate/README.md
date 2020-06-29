# ACME Certificate

This submodule creates an ACME certificate and requires an existing ACME account to fulfill the request.

## Usage

Example using dnsimple.com as dns challenge provider:

```hcl
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

module "acme_certificate" {
  source  = "nephosolutions/certificate/acme//modules/certificate"
  version = "2.0.0"

  acme_account_id           = "${module.acme_account.id}"
  acme_account_private_key  = "${module.acme_account.private_key}"

  dns_names     = [
    "www.example.com",
    "www2.example.com"
  ]

  dns_challenge = {
    provider = "dnsimple"

    config {
      DNSIMPLE_OAUTH_TOKEN = "${var.dnsimple_token}"
    }
  }
}
```

* The `DNSIMPLE_OAUTH_TOKEN` could alternatively be set as runtime environment variable
* The ACME provider's `server_url` can be set to `https://acme-staging-v02.api.letsencrypt.org/directory` for staging

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| acme | n/a |
| null | n/a |
| template | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_account\_id | The ACME account ID | `any` | n/a | yes |
| acme\_account\_private\_key | The ACME account private key used to request the certificate. | `any` | n/a | yes |
| dns\_challenge | The [DNS challenge\|https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges] to use in fulfilling the request. | <pre>object({<br>    config   = map(string)<br>    provider = string<br>  })</pre> | n/a | yes |
| dns\_names | A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for. | `list(string)` | n/a | yes |
| min\_days\_remaining | ration of a certificate before a renewal is attempted. A value of less than 0 means that the certificate will never be renewed. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| certificate | The requested ACME certificate |
| fullchain | The requested ACME certificate full chain |
| private\_key | The requested ACME certificate private key |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

[1]: https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges
