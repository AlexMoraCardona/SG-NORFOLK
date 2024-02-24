class IdCustomerToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :customer, null: false, foreign_key: true
    add_reference :contracts, :analyst, null: false, foreign_key: true
  end
end
