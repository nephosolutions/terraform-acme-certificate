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

output "certificate" {
  description = "The requested ACME certificate"
  value       = module.acme_certificate.certificate
}

output "private_key" {
  description = "The requested ACME certificate private key"
  value       = module.acme_certificate.private_key
}

output "fullchain" {
  description = "The requested ACME certificate full chain"
  value       = module.acme_certificate.fullchain
}
