class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :email
      t.string :name
      t.string :password_digest
    end
  end
end
