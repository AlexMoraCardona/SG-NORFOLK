class ChangeContractProductToPreInvoices < ActiveRecord::Migration[7.0]
  def change
    change_column :contract_products, :cost, :decimal, default: 0
    change_column :contract_products, :sale_value, :decimal, default: 0
    change_column :contract_products, :percentage, :decimal, default: 0
    change_column :pre_invoices, :value_tax, :decimal, default: 0
    change_column :pre_invoices, :value_discount, :decimal, default: 0
    change_column :pre_invoices, :value_bruto, :decimal, default: 0
    change_column :pre_invoices, :value_interest, :decimal, default: 0
    change_column :pre_invoices, :total_balance, :decimal, default: 0
    change_column :pre_invoices, :value_others, :decimal, default: 0
    change_column :pre_invoices, :value_neto, :decimal, default: 0
    change_column :products, :cost, :decimal, default: 0

  end
end

