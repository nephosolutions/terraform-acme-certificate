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

variable "email_address" {
  description = "The contact email address for the account."
}

variable "server_url" {
  description = "The Let's Encrypt server URL to use; defaults to production but can be set to 'https://acme-staging.api.letsencrypt.org/directory' for staging."
  default = "https://acme-v02.api.letsencrypt.org/directory"
}
