class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    
    validates :nro_document,  presence: true #Validar la presencia
    validates :name, presence: true #Validar la presencia
    validates :username,  presence: true, length: { in: 3..15}, 
    format: { with: /\A[a-z0-9A-Z]+\z/, message: :invalid} #Validar la presencia
    validates :email,  presence: true
    validates :password_digest,  presence: true #Validar la presencia
    validates :username, uniqueness: true #Valor unico en bd
    validates :email, uniqueness: true #Valor unico en bd

    validates :password_digest, length: {minimum: 6}

    before_save :downcase_attributes

    private
    def downcase_attributes
        self.username = username.downcase 
        self.email = email.downcase 
    end  

end
