class IpAddr < ActiveRecord::Base
  belongs_to :subnet

  def fill_subnet(subnet_addr)
    net = IPAddress.parse(subnet_addr)
    net.each_host do |host|
      IpAddr.new(ip: host, )
    end
  end
end
