class Contract < ApplicationRecord
    belongs_to :customer
    belongs_to :analyst
    has_many :contract_products
end
