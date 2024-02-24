class Contact < ApplicationRecord
    belongs_to :customer

    def label_state(dato)
        if dato == 0 ; 'Activo'
        elsif  dato == 1 ; 'Inactivo'
        end 
    end   
    
    def label_portal_Access(dato)
        if dato == 0 ; 'NO'
        elsif  dato == 1 ; 'SI'
        end 
    end   
    

    
end
