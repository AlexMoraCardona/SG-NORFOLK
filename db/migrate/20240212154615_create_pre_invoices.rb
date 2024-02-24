class CreatePreInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_invoices do |t|
      t.date :date_creation
      t.date :date_filing
      t.date :date_expiration
      t.date :date_full_payment
      t.date :date_last_payment
      t.string :id_filing
      t.integer :days_late, default: 0
      t.integer :state, default: 0
      t.string :observations
      t.integer :value_tax, default: 0
      t.integer :value_discount, default: 0
      t.integer :value_bruto, default: 0
      t.integer :value_interest, default: 0
      t.integer :value_others, default: 0
      t.integer :value_neto, default: 0
      t.integer :total_balance, default: 0
      t.integer :value_paid, default: 0
      t.integer :user_pre_invoice, default: 0

      t.timestamps
    end
    add_reference :pre_invoices, :contract, null: true, foreign_key: true
    add_reference :pre_invoices, :product, null: true, foreign_key: true
    add_reference :pre_invoices, :customer, null: true, foreign_key: true
    add_reference :pre_invoices, :analyst, null: true, foreign_key: true
  end
end
