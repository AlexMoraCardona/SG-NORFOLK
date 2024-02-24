class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.string :description
      t.string :brands
      t.string :type_product
      t.string :category_l1
      t.string :category_l2
      t.string :category_l3
      t.integer :cost
      t.string :codigo_inter
      t.string :id_inter

      t.timestamps
    end
  end
end
