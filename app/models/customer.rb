class Customer < ApplicationRecord
    has_many :contacts
    has_many :contracts
    belongs_to :cost_center

    def label_class(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'Jurídica'
        elsif  dato == 2 ; 'Persona Natural'
        end 
    end   


    def nombre_empresa(dato)
        nombre = Entity.find(dato.to_i).name
    end   


    def label_taxpayer_type(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'Gran Contribuyente'
        elsif  dato == 2 ; 'Contribuyente Mediano Alto'
        elsif  dato == 3 ; 'Contribuyente Mediano'
        elsif  dato == 4 ; 'Contribuyente Pequeño'
        elsif  dato == 5 ; 'Contribuyente Micro'
        elsif  dato == 6 ; 'Entidades de Derecho Público'
        elsif  dato == 7 ; 'Régimen Especial o Sin Ánimo de Lucro'
        elsif  dato == 8 ; 'Contribuyente por clasificar'
        elsif  dato == 9 ; 'Asalariado'
        elsif  dato == 10 ; 'Contribuyente no asalariado'
        end 
    end   
    
    def label_category(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'VIP'
        elsif  dato == 2 ; 'Aliado'
        elsif  dato == 3 ; 'Cliente'
        elsif  dato == 4 ; 'Referido'
        end 
    end     
    
    def label_priority(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'Baja'
        elsif  dato == 2 ; 'Media'
        elsif  dato == 3 ; 'Alta'
        end 
    end  
    
    def label_taxes(dato)
        if dato == 0 ; 'NO'
        elsif  dato == 1 ; 'SI'
        end 
    end  

    def label_points_program(dato)
        if dato == 0 ; 'NO'
        elsif  dato == 1 ; 'SI'
        end 
    end  

    
    
    def label_status(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'Activo'
        elsif  dato == 2 ; 'Inactivo'
        end 
    end  
    
    def label_credit_term(dato)
        if dato == 0 ; 'Sin seleccionar'
        elsif  dato == 1 ; 'Contado(C.O.D)'
        elsif  dato == 2 ; 'CRÉDITO'
        end 
    end  

end
