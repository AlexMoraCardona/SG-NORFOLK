class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer
      t.integer :class, default: 0
      t.integer :taxpayer_type, default: 0
      t.string :name
      t.string :ruc
      t.string :dv
      t.integer :type, default: 0
      t.integer :priority, default: 0
      t.integer :employees, default: 0
      t.string :industry
      t.date :birth_date
      t.integer :taxes, default: 0
      t.integer :status, default: 0
      t.string :cellular
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :email
      t.string :phone_1
      t.string :phone_2
      t.integer :credit_term, default: 0
      t.integer :due_days, default: 0
      t.integer :credit_amount_limit, default: 0
      t.integer :points_program, default: 0
      t.string :account_receivable
      t.string :account_receivable_client
      t.string :balance

      t.timestamps
    end
  end
end
