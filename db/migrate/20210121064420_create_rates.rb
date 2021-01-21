class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :rate

      t.timestamps
    end
  end
end
