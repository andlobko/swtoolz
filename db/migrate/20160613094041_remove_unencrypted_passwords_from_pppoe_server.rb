class RemoveUnencryptedPasswordsFromPppoeServer < ActiveRecord::Migration
  def change
    remove_column :pppoe_servers, :telnet_password, :string
    remove_column :pppoe_servers, :snmp_password, :string
  end
end
