class AddColumnNoteToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :note, :text, column_options:{null: true}
  end
end
