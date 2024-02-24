class RenameCustomersClassColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :class, :customer_class
  end
end
