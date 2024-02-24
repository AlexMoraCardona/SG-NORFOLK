class CostCenter < ApplicationRecord
    def label_inactive(dato)
        if dato == 0 ; 'NO'
        elsif  dato == 1 ; 'SI'
        end 
    end   

end
