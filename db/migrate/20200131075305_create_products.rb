class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :material
      t.string :category
      t.string :color

      t.timestamps
    end
  end
end
