class CreateOwnerplants < ActiveRecord::Migration[6.0]
  def change
    create_table :owner_plants do |t|
      t.integer :owner_id
      t.integer :plant_id
      t.timestamps null: false
    end
  end
end
