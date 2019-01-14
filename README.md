# ACME Certificate

The Automated Certificate Management Environment (ACME) is an evolving standard for the automation of a domain-validated certificate authority. Clients register themselves on an authority using a private key and contact information, and answer challenges for domains that they own by supplying response data issued by the authority via either HTTP or DNS.

Via this process, they prove that they own the domains in question, and can then request certificates for them via the CA. No part of this process requires user interaction, a traditional blocker in obtaining a domain validated certificate.

As the usage model of Terraform generally sees it as being run on a different server than a certificate would normally be placed on, the acme_certifiate resource only supports DNS challenges. This method authenticates certificate domains by requiring the requester to place a TXT record on the FQDNs in the certificate.

The ACME provider responds to DNS challenges automatically by utilizing one of the [supported DNS challenge providers][1]. Most providers take credentials as environment variables, but if you would rather use configuration for this purpose, you can by specifying config blocks within a dns_challenge block, along with the provider parameter.

## Usage

Example using dnsimple.com as dns challenge provider:

```hcl
provider "acme" {  
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

module "acme_certificate" {
  source  = "nephosolutions/certificate/acme"
  version = "1.0.2"

  dns_names     = [
    "www.example.com",
    "www2.example.com"
  ]

  email_address = "info@example.com"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dns\_challenge | The DNS challenge to fulfill the request. | map | - | yes |
| dns\_names | A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for. | list | - | yes |
| email\_address | The contact email address for the account. | string | - | yes |
| min\_days\_remaining | ration of a certificate before a renewal is attempted. A value of less than 0 means that the certificate will never be renewed. | string | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| certificate | The requested ACME certificate |
| fullchain | The requested ACME certificate full chain |
| private\_key | The requested ACME certificate private key |

[1]: https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges
