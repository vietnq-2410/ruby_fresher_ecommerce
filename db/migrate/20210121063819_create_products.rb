class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.integer :view
      t.integer :quantity
      t.integer :price
      t.integer :sale

      t.timestamps
    end
  end
end
