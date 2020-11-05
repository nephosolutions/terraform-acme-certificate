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

output "certificate_domain" {
  description = "The common name of the certificate."
  value       = "${random_pet.dns_name_1.id}.${var.dns_domain}"
}

output "certificate_pem" {
  description = "The certificate in PEM format."
  value       = module.acme_certificate.certificate_pem
}

output "fullchain_pem" {
  description = "The certificate concatenated with the intermediate certificate of the issuer."
  value       = module.acme_certificate.fullchain_pem
}

output "issuer_pem" {
  description = "The intermediate certificate of the issuer."
  value       = module.acme_certificate.issuer_pem
}

output "private_key_pem" {
  description = "The requested ACME certificate private key"
  value       = module.acme_certificate.private_key_pem
}
