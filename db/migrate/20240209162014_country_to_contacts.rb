class CountryToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :analysts, :country, :string 
    add_column :customers, :name_project, :string 
    add_column :customers, :name_promotora, :string 
    add_column :contracts, :status_contract, :string 
    add_column :customers, :email_1, :string 
    add_column :customers, :email_2, :string 
    add_column :customers, :email_3, :string 
    add_column :customers, :email_4, :string 
    add_column :customers, :email_5, :string 
    add_column :customers, :email_6, :string 
    add_column :customers, :email_7, :string 
    add_column :customers, :email_8, :string 
    add_column :customers, :email_9, :string 
    add_column :customers, :email_10, :string 
    add_column :contract_products, :sale_value, :integer, default: 0
    add_column :contract_products, :percentage, :integer, default: 0
  end
end
