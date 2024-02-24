class Analyst < ApplicationRecord
    has_many :contracts
    
    validates :name, presence: true #Validar la presencia
end
