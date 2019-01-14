# ACME Certificate

This submodule creates an ACME certificate and requires an existing ACME account to fulfill the request.

## Usage

Example using dnsimple.com as dns challenge provider:

```hcl
module "acme_certificate" {
  source  = "nephosolutions/certificate/acme//modules/certificate"
  version = "0.1.0"

  acme_account_private_key = "${module.acme_account.private_key}"

  dns_names     = ["www.example.com", "www2.example.com"]
  dns_challenge = {
    provider = "dnsimple"

    config {
      DNSIMPLE_OAUTH_TOKEN = "${var.dnsimple_token}"
    }
  }
}
```

The `DNSIMPLE_OAUTH_TOKEN` could alternatively be set as runtime environment variable.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acme\_account\_private\_key | The ACME account private key used to request the certificate. | string | - | yes |
| dns\_challenge | The DNS challenge to use in fulfilling the request. https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges | map | - | yes |
| dns\_names | A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for. | list | - | yes |
| min\_days\_remaining | ration of a certificate before a renewal is attempted. A value of less than 0 means that the certificate will never be renewed. | string | `30` | no |
| server\_url | The Let's Encrypt server URL to use; defaults to production but can be set to 'https://acme-staging.api.letsencrypt.org/directory' for staging. | string | `https://acme-v02.api.letsencrypt.org/directory` | no |

## Outputs

| Name | Description |
|------|-------------|
| certificate | - |
| fullchain | - |
| private\_key | - |

[1]: https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges