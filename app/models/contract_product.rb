class ContractProduct < ApplicationRecord
    belongs_to :product
    belongs_to :contract
    has_many   :pre_invoices


    def label_periodicity(dato)
        if dato == 0 ; 'Mensual'
        elsif  dato == 1 ; 'Trimestral'
        elsif  dato == 2 ; 'Cuatrimestral'
        elsif  dato == 3 ; 'Semestral'
        elsif  dato == 4 ; 'OneTime'
        end 
    end   

    def label_factor(dato)
        if dato == 0 ; 'MONTO'
        elsif  dato == 1 ; 'PORCENTAJE'
        end 
    end   


end
