class AddColumnsToFurimas < ActiveRecord::Migration[7.0]
  def change
    add_column :furimas, :name, :string
    add_column :furimas, :info, :text
    add_column :furimas, :category_id, :integer
    add_column :furimas, :sales_status_id, :integer
    add_column :furimas, :shipping_fee_status_id, :integer
    add_column :furimas, :prefecture_id, :integer
    add_column :furimas, :scheduled_delivery_id, :integer
    add_column :furimas, :price, :integer
    add_reference :furimas, :user, null: false, foreign_key: true
  end
end
