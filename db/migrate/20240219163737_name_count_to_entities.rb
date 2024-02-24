class NameCountToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :name_count, :string
  end
end
