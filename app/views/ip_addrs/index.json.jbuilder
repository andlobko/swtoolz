json.array!(@ip_addrs) do |ip_addr|
  json.extract! ip_addr, :id, :ip, :description
  json.url subnet_ip_addr_url(ip_addr, format: :json)
end
