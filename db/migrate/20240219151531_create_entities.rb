class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :banco
      t.string :type_count
      t.string :number_count

      t.timestamps
    end
  end
end
