class AddEncryptedToPppoeServer < ActiveRecord::Migration
  def change
    add_column :pppoe_servers, :encrypted_telnet_password, :string
    add_column :pppoe_servers, :encrypted_snmp_password, :string
  end
end
