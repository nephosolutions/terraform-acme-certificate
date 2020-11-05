describe attribute("certificate_domain") do
  it { should match /.*\.strebitz\.io/ }
end

certificate_pem = attribute("certificate_pem")
issuer_pem = attribute("issuer_pem")

describe attribute("fullchain_pem") do
  it { should eq certificate_pem + issuer_pem }
end
