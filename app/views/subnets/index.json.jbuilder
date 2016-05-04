json.array!(@subnets) do |subnet|
  json.extract! subnet, :id, :subnet_addr, :description
  json.url subnet_url(subnet, format: :json)
end
