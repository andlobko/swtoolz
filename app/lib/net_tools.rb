module NetTools
  def icmp_ping?(host)
    result_array = Array.new(3) do |ping_result|
      pp = Net::Ping::ICMP.new(host)
      ping_result = pp.ping?
    end
    return false if result_array.count(false) > 1
    return true
  end
end