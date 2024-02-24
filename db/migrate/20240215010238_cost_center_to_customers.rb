class CostCenterToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :cost_center, null: true, foreign_key: true
  end
end
