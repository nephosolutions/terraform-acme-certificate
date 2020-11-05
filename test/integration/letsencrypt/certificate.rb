certificate_domain = attribute("certificate_domain")
certificate_pem = attribute("certificate_pem")

describe x509_certificate(content: certificate_pem) do
  its('issuer.CN') { should eq "Fake LE Intermediate X1" }
  its('subject.CN') { should eq certificate_domain }
  its('key_length') { should be 2048 }
  its('validity_in_days') { should be > 30 }
  its('version') { should eq 2 }
end
