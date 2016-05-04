class CreateIpAddrs < ActiveRecord::Migration
  def change
    create_table :ip_addrs do |t|
      t.text :ip
      t.text :description

      t.timestamps null: false
    end
    add_index :ip_addrs, :ip
  end
end
