class ChangeTypeToCustomers < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :type, :category
    rename_column :customers, :customer, :customer_name    
  end
end
