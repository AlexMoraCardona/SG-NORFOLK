class AdrressCompletaToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :address_completa, :string
    add_column :entities, :document_entity, :string
  end
end
