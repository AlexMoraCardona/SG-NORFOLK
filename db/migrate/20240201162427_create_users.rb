class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nro_document, null:false
      t.string :name
      t.string :username, null:false
      t.string :email, null:false
      t.string :password_digest
      t.integer :state, default: 0
      t.integer :level, default: 0
      t.string :activity

      t.timestamps
    end
    add_index :users, :nro_document, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
