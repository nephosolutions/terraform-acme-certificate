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

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "random_pet" "dns_name_1" {
}

resource "random_id" "dns_name_2" {
  byte_length = 4
  prefix      = "${random_pet.dns_name_1.id}-"
}

module "acme_certificate" {
  source = "../../.."

  dns_challenge = var.dns_challenge

  dns_names = [
    "${random_pet.dns_name_1.id}.${var.dns_domain}",
    "${lower(random_id.dns_name_2.hex)}.${var.dns_domain}",
  ]

  email_address = var.email_address
}
