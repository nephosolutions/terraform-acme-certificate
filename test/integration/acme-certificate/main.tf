#   Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

resource "random_pet" "1st_dns_name" {}

resource "random_id" "2nd_dns_name" {
  byte_length = 4
  prefix      = "${random_pet.1st_dns_name.id}-"
}

module "acme_certificate" {
  source = "../../../"
  
  dns_challenge = "${var.dns_challenge}"
  
  dns_names = [
    "${random_pet.1st_dns_name.id}.${var.dns_domain}",
    "${lower(random_id.2nd_dns_name.hex)}.${var.dns_domain}"
  ]

  email_address = "${var.email_address}"
  server_url    = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
