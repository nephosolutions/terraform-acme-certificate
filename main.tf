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

module "acme_account" {
  source = "modules/account"

  email_address = "${var.email_address}"
}

module "acme_certificate" {
  source = "modules/certificate"

  acme_account_id          = "${module.acme_account.id}"
  acme_account_private_key = "${module.acme_account.private_key}"

  dns_challenge = "${var.dns_challenge}"

  dns_names = [
    "${var.dns_names}"
  ]
}
