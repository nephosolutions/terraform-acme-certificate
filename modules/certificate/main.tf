# Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "tls_private_key" "certificate" {
  algorithm = "RSA"
}

# This is required as the resource acme_certificate does use the argument registration_url anymore
resource "null_resource" "dependency_acme_account_id" {
  triggers = {
    acme_account_id = var.acme_account_id
  }
}

resource "tls_cert_request" "certificate" {
  depends_on = [null_resource.dependency_acme_account_id]

  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.certificate.private_key_pem

  dns_names = var.dns_names

  subject {
    common_name = var.dns_names[0]
  }
}

resource "acme_certificate" "certificate" {
  account_key_pem         = var.acme_account_private_key
  certificate_request_pem = tls_cert_request.certificate.cert_request_pem
  min_days_remaining      = var.min_days_remaining
  recursive_nameservers   = var.recursive_nameservers != [] ? var.recursive_nameservers : null

  dynamic "dns_challenge" {
    for_each = [var.dns_challenge]
    content {
      config   = dns_challenge.value.config
      provider = dns_challenge.value.provider
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "fullchain" {
  template = "$${certificate}$${private_key}$${ca_certificate}"

  vars = {
    certificate    = acme_certificate.certificate.certificate_pem
    private_key    = tls_private_key.certificate.private_key_pem
    ca_certificate = acme_certificate.certificate.issuer_pem
  }
}
