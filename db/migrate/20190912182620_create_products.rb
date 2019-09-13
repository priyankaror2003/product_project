class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.string :year
      t.string :ram
      t.string :external_storage
      t.timestamps
    end
  end
end
