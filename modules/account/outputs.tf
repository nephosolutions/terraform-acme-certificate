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

output "id" {
  description = "The ACME account ID"
  value       = acme_registration.account.id
}

output "registration_url" {
  description = "The ACME account registration URL"
  value       = acme_registration.account.registration_url
}

output "private_key" {
  description = "The ACME account private key"
  value       = tls_private_key.account.private_key_pem
}
