class CreateContractProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_products do |t|
      t.integer :factor, default: 0
      t.integer :periodicity, default: 0
      t.integer :cost, default: 0
      t.date :date_initial
      t.date :date_final
      t.string :cod_product_inter
      t.string :id_product_inter

      t.timestamps
    end
    add_reference :contract_products, :contract, null: true, foreign_key: true
    add_reference :contract_products, :product, null: true, foreign_key: true
  end
end
