class UpdatePlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :owner_id, :integer
  end
end
