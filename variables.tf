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

variable "dns_challenge" {
  description = "The [DNS challenge|https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges] to use in fulfilling the request."

  type = object({
    config   = map(string)
    provider = string
  })
}

variable "dns_names" {
  description = "A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for."
  type        = list(string)
}

variable "email_address" {
  description = "The contact email address for the account."
}

variable "min_days_remaining" {
  description = "ration of a certificate before a renewal is attempted. A value of less than 0 means that the certificate will never be renewed."
  default     = 30
}

variable "recursive_nameservers" {
  description = "The recursive nameservers that will be used to check for propagation of the challenge record. Defaults to your system-configured DNS resolvers."
  default     = []
}
