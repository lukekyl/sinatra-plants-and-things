class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :owner_id
      t.string :plant_id
      t.string :reply
    end
  end
end
