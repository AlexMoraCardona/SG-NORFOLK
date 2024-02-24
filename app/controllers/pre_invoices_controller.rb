class PreInvoicesController < ApplicationController
    def index

        if params[:customer_id].present?  then
            @pre_invoices = PreInvoice.where("customer_id = ?", params[:customer_id].to_i) 
        else    
            @pre_invoices = PreInvoice.all
        end     
    end 
    
    def show

    end

    def clientes
        if params[:customer_id].present?  then
            @pre_invoices = PreInvoice.where("customer_id = ?", params[:customer_id].to_i) 
        else    
            @pre_invoices = PreInvoice.all
        end  
    end    

    def estados
        if params[:state].present?  then
            if params[:state].to_i == 4 then
                @pre_invoices = PreInvoice.all 
            else    
                @pre_invoices = PreInvoice.where("state = ?", params[:state].to_i)
            end                 
        else    
            @pre_invoices = PreInvoice.all
        end  
    end    

    def radicaciones
        @pre_invoices = PreInvoice.where("date_filing is ?", nil) 
    end 

    def new
      @pre_invoice = PreInvoice.new  
    end    

    def create
        @pre_invoice = PreInvoice.new(pre_invoice_params)
        @pre_invoice.observations = PreInvoice.observaciones(@pre_invoice)
        if @pre_invoice.save then
            PreInvoice.calculos(@pre_invoice)
            redirect_to pre_invoices_path, notice: t('.created') 
        else
            render :new, pre_invoices: :unprocessable_entity
        end    
    end    
 
    def edit 
        @pre_invoice = PreInvoice.find(params[:id])
    end
    
    def update 
        @pre_invoice = PreInvoice.find(params[:id])
        if (params[:pre_invoice][:value_bruto].to_f + params[:pre_invoice][:value_tax].to_f  + params[:pre_invoice][:value_interest].to_f + params[:pre_invoice][:value_others].to_f  - params[:pre_invoice][:value_discount].to_f) < 1 then
            redirect_to customer_path(@pre_invoice.customer_id), alert: 'El valor neto no puede ser menor o igual a a cero!'
        else
            if @pre_invoice.value_paid.to_f > (params[:pre_invoice][:value_bruto].to_f + params[:pre_invoice][:value_tax].to_f  + params[:pre_invoice][:value_interest].to_f + params[:pre_invoice][:value_others].to_f  - params[:pre_invoice][:value_discount].to_f) 
                redirect_to customer_path(@pre_invoice.customer_id), alert: 'El valor pagado no puede ser mayor al valor de la cotización!'
            else
                if @pre_invoice.update(pre_invoice_params)
                    PreInvoice.calculos(@pre_invoice)
                    redirect_to customer_path(@pre_invoice.customer_id), notice: 'Cotización actualizada correctamente'
                else
                    render :edit, status: :unprocessable_entity
                end
            end    
        end

    end    

    def destroy
        @pre_invoice = PreInvoice.find(params[:id])
        @pre_invoice.destroy
        redirect_to pre_invoices_path, notice: 'Nivel borrado correctamente', pre_invoice: :see_other
    end    

    def cc
        @pre_invoice = PreInvoice.find(params[:id])

        respond_to do |format| 
            format.html
            format.pdf {render  pdf: 'cc',
                margin: {top: 10, bottom: 10, left: 10, right: 10 },
                disable_javascript: true,
                page_size: 'letter',
                footer: {
                    right: 'Página: [page] de [topage]'
                   }                
                       } 
        end

    end

    private

    def pre_invoice_params
        params.require(:pre_invoice).permit(:date_creation, :date_filing, :date_expiration, :date_full_payment, :date_last_payment, :id_filing, 
        :days_late, :state, :observations, :value_tax, :value_discount, :value_bruto, :value_interest, :value_others, :value_neto, 
        :total_balance, :value_paid, :user_pre_invoice, :contract_id, :product_id, :customer_id, :analyst_id, :contract_product_id)
    end 

end    

