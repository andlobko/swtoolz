class CreateDeviceTemplates < ActiveRecord::Migration
  def change
    create_table :device_templates do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
