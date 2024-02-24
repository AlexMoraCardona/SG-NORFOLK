class PreInvoice < ApplicationRecord
    belongs_to :contract
    belongs_to  :product
    belongs_to  :customer
    belongs_to  :analyst
    belongs_to  :contract_product
    
    def label_state(dato)
        if dato == 0 ; 'Vigente'
        elsif  dato == 1 ; 'Cancelado'
        elsif  dato == 2 ; 'Vencido'
        elsif  dato == 3 ; 'Eliminado'
        end 
    end  

    def self.calculos(pre_invoice)

        pre_invoice.value_neto = (pre_invoice.value_bruto.to_f + pre_invoice.value_tax.to_f + pre_invoice.value_interest.to_f + pre_invoice.value_others.to_f - pre_invoice.value_discount.to_f)
        pre_invoice.total_balance  = (pre_invoice.value_neto.to_f - pre_invoice.value_paid.to_f)
        if pre_invoice.date_expiration.present? then
            if pre_invoice.date_expiration < Date.today then
                pre_invoice.days_late  =  (Date.today - pre_invoice.date_expiration).to_i    
            else
                pre_invoice.days_late  = 0
            end
        else
            pre_invoice.days_late  = 0    
        end    

        pre_invoice.days_late = 0 if pre_invoice.total_balance.to_f < 1
        pre_invoice.state = 0 if pre_invoice.total_balance.to_f > 0 && pre_invoice.days_late < 1
        pre_invoice.state = 1 if pre_invoice.total_balance.to_f < 1
        pre_invoice.state = 2 if pre_invoice.total_balance.to_f > 0 && pre_invoice.days_late > 0
        pre_invoice.save
    end 
    
    def label_user(dato)
        analista = Analyst.find(dato)
        return analista.name
    end  

    def self.observaciones(pre_invoice)

        obs = ''

      if pre_invoice.contract_product.factor == 0 then
        if pre_invoice.contract_product.periodicity == 4
            obs = pre_invoice.product.name + ' Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + ', ' +'Proyecto: ' + pre_invoice.customer.name_project + ' del mes: ' +  mes(pre_invoice.date_creation.month).to_s + ' del año: ' + pre_invoice.date_creation.strftime("%Y").to_s
        else
           if  pre_invoice.contract_product.periodicity == 0 then
            obs = pre_invoice.product.name + ' Correspondiente a la venta por valor de: $ ' + pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del mes: ' + mes((pre_invoice.date_creation.month).month.ago.month) + ' del año: ' + pre_invoice.datoano(date_creation).to_s 

           elsif  pre_invoice.contract_product.periodicity == 1 then
            obs = pre_invoice.product.name + ' Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + trimestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 

           elsif  pre_invoice.contract_product.periodicity == 2 then
            obs = pre_invoice.product.name + ' Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + cuatrimestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 
           else 
            obs = pre_invoice.product.name + ' Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + semestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 
           end 
        end    
      else
        if pre_invoice.contract_product.periodicity == 4
            obs = pre_invoice.product.name + ' %(' + pre_invoice.contract_product.percentage.to_s + ') Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + ', ' + 'Proyecto: ' + pre_invoice.customer.name_project + ' del mes: ' + mes(pre_invoice.date_creation.month).to_s + ' del año: ' + pre_invoice.date_creation.strftime("%Y").to_s
        else
           if  pre_invoice.contract_product.periodicity == 0 then
            obs = pre_invoice.product.name + ' %(' + pre_invoice.contract_product.percentage.to_s + ') Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del mes: ' + mes((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 

           elsif  pre_invoice.contract_product.periodicity == 1 then
            obs = pre_invoice.product.name + ' %(' + pre_invoice.contract_product.percentage.to_s + ') Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + trimestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 

           elsif  pre_invoice.contract_product.periodicity == 2 then
            obs = pre_invoice.product.name + ' %(' + pre_invoice.contract_product.percentage.to_s + ') Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + cuatrimestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 
           else 
            obs = pre_invoice.product.name + ' %(' + pre_invoice.contract_product.percentage.to_s + ') Correspondiente a la venta por valor de: $' + 
            pre_invoice.value_neto.to_s + 'Proyecto: ' + pre_invoice.customer.name_project + ' del  ' + semestre((pre_invoice.date_creation.month).month.ago.month).to_s + ' del año: ' + pre_invoice.datoano(date_creation).to_s 
           end 
        end    
     
      end  
    end    
  
    def datoano(fecha)
        dato = ''
        if fecha.month.to_i == 1 then
            dato = (fecha.strftime("%Y")).to_i - 1
        else
            dato = (fecha.strftime("%Y")).to_i
        end    
    end

    def self.mes(dato)
        nombre = ''
        if dato.to_i == 1 then nombre = 'enero' 
        elsif dato.to_i == 2 then nombre = 'febrero'
        elsif dato.to_i == 3 then nombre = 'marzo'
        elsif dato.to_i == 4 then nombre = 'abril'
        elsif dato.to_i == 5 then nombre = 'mayo'
        elsif dato.to_i == 6 then nombre = 'junio'
        elsif dato.to_i == 7 then nombre = 'julio'
        elsif dato.to_i == 8 then nombre = 'agosto'
        elsif dato.to_i == 9 then nombre = 'septiembre'
        elsif dato.to_i == 10 then nombre = 'octubre'
        elsif dato.to_i == 11 then nombre = 'noviembre'
        elsif dato.to_i == 12 then nombre = 'diciembre'
        end                                                                                                                                 
    end    

    def self.trimestre(mes)
        dato = ''
        if mes == 3 then
            dato = ' Primer trimestre '
        elsif mes == 6 then
            dato = ' Segundo trimestre'
        elsif mes == 9 then
            dato = ' Tercer trimestre'
        elsif mes == 12 then
            dato = ' Cuarto trimestre'
        end  
    end    

    def self.cuatrimestre(mes)
        dato = ''
        if mes == 4 then
            dato = ' Primer cuatrimestre '
        elsif mes == 8 then
            dato = ' Segundo cuatrimestre'
        elsif mes == 12 then
            dato = ' Tercer cuatrimestre'
        end  
    end    

    def self.semestre(mes)
        dato = ''
        if mes == 6 then
            dato = ' Primer semestre '
        elsif mes == 12 then
            dato = ' Segundo semestre'
        end  
    end    

end
