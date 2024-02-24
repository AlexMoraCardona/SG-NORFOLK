class ContractProductToPreInvoices < ActiveRecord::Migration[7.0]
  def change
    add_reference :pre_invoices, :contract_product, null: true, foreign_key: true
  end
end
