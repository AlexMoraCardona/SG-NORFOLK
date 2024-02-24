class CreateCostCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_centers do |t|
      t.string :id_interno
      t.string :id_interfuerza
      t.string :name
      t.string :description
      t.integer :inactive, default: 0

      t.timestamps
    end
  end
end
