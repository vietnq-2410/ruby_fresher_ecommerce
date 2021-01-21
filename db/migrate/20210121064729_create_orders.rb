class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :customer_name
      t.string :phone
      t.text :address
      t.integer :ship_method
      t.integer :pay_method
      t.integer :status, default: 1
      t.integer :payment_status

      t.timestamps
    end
  end
end
