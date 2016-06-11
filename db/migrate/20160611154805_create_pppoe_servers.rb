class CreatePppoeServers < ActiveRecord::Migration
  def change
    create_table :pppoe_servers do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :telnet_password
      t.string :snmp_password
      t.string :snmp_user

      t.timestamps null: false
    end
  end
end
