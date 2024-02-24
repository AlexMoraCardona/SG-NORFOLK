class StatusToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :state_product, :string
    add_column :products, :detail, :string
    add_column :products, :item_number, :string
    add_column :products, :store_product, :string
    add_column :products, :taxid, :string
  end
end
