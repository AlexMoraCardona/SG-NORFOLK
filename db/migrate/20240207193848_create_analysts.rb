class CreateAnalysts < ActiveRecord::Migration[7.0]
  def change
    create_table :analysts do |t|
      t.string :name, null:false
      t.string :document
      t.string :email
      t.string :cellular
      t.string :phone

      t.timestamps
    end
  end
end
