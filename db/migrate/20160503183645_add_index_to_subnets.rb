class AddIndexToSubnets < ActiveRecord::Migration
  def change
    remove_index :subnets, :subnet_addr
    add_index :subnets, :subnet_addr, unique: true
  end
end
