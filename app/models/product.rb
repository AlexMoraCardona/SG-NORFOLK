class Product < ApplicationRecord
    validates :name, presence: true #Validar la presencia
end
