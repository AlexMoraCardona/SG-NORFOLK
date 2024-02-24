class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.integer :id_interno, default: 0
      t.string  :name_contact
      t.string  :qualification
      t.string  :personal_email
      t.string  :work_email
      t.string  :address
      t.string  :city
      t.string  :pulled_apart
      t.string  :country
      t.string  :website
      t.string  :fax
      t.string  :company
      t.string  :position
      t.string  :deparment
      t.string  :agent
      t.date    :birthDate
      t.integer :portal_Access, default: 0
      t.string  :portal_User
      t.string  :portal_Pass	
      t.string  :portal_Profile
      t.string  :portal_emaill
      t.integer :state, default: 0	
      t.string  :phone_1
      t.string  :phone_2
      t.string  :cellular

      t.timestamps
    end
    add_reference :contacts, :customer, null: true, foreign_key: true
  end
end
