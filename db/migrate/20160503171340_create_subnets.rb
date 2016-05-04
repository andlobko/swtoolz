class CreateSubnets < ActiveRecord::Migration
  def change
    create_table :subnets do |t|
      t.text :subnet_addr
      t.text :description

      t.timestamps null: false
    end
    add_index :subnets, :subnet_addr
  end
end
