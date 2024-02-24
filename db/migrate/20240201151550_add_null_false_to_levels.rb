class AddNullFalseToLevels < ActiveRecord::Migration[7.0]
  def change
    change_column_null :levels, :name, false 
  end
end
