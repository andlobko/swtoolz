class AddSubnetToIpAddr < ActiveRecord::Migration
  def change
    add_reference :ip_addrs, :subnet, index: true, foreign_key: true
  end
end
