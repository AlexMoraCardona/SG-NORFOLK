class EntityIdToCostumers < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :token, :string
    add_column :customers, :entity_id, :integer, default: 1
    add_column :users, :entity_id, :integer, default: 1
  end
end
