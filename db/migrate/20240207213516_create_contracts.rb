class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :name_project
      t.string :name_promotora
      t.string :classification
      t.string :cost_center_interfuerza
      t.string :id_cost_center_interfuerza

      t.timestamps
    end
  end
end
