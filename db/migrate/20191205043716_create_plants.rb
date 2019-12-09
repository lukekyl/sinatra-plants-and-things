class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :family
      t.string :description
      t.string :care
    end
  end
end
