class AddEncryptedIvToPppoeServers < ActiveRecord::Migration
  def change
    add_column :pppoe_servers, :encrypted_telnet_password_iv, :string
    add_column :pppoe_servers, :encrypted_snmp_password_iv, :string
  end
end
