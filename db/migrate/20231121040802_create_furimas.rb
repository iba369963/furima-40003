class CreateFurimas < ActiveRecord::Migration[7.0]
  def change
    add_column :furimas, :name, :string, null: false
    add_column :furimas, :info, :text, null: false
    add_column :furimas, :category_id, :integer, null: false
    add_column :furimas, :sales_status_id, :integer, null: false
    add_column :furimas, :shipping_fee_status_id, :integer, null: false
    add_column :furimas, :prefecture_id, :integer, null: false
    add_column :furimas, :scheduled_delivery_id, :integer, null: false
    add_column :furimas, :price, :integer, null: false
    add_reference :furimas, :user, null: false, foreign_key: true
  end
end
