json.array!(@pppoe_servers) do |pppoe_server|
  json.extract! pppoe_server, :id, :name, :description, :address, :telnet_password, :snmp_password, :snmp_user
  json.url pppoe_server_url(pppoe_server, format: :json)
end
