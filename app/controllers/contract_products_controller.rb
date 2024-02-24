class ContractProductsController < ApplicationController
    def index
            @contract_products = ContractProduct.all 
    end    

    def new
      @contract_product = ContractProduct.new  
    end    

    def create
        @contract_product = ContractProduct.new(contract_product_params)
        @product = Product.find(@contract_product.product_id) if @contract_product.product_id.present?
        @contract_product.cod_product_inter =  @product.codigo_inter if @product.codigo_inter.present?
        @contract_product.id_product_inter =  @product.id_inter if @product.id_inter.present?

        if @contract_product.save then
            if @contract_product.periodicity == 4 then
                crear_cotizacion(@contract_product)
            end

            redirect_to edit_contract_path(@contract_product.contract_id), notice: t('.created')
        else
            render :new, contract_products: :unprocessable_entity
        end    
    end    
 
    def edit
        @contract_product = ContractProduct.find(params[:id])
    end
    
    def update
        @contract_product = ContractProduct.find(params[:id])
        @product = Product.find(@contract_product.product_id) if @contract_product.product_id.present?
        @contract_product.cod_product_inter =  @product.codigo_inter if @product.codigo_inter.present?
        @contract_product.id_product_inter =  @product.id_inter if @product.id_inter.present?

        if @contract_product.update(contract_product_params)
            redirect_to edit_contract_path(@contract_product.contract_id), notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @contract_product = ContractProduct.find(params[:id])
        @id = @contract_product.contract_id
        @contract_product.destroy
         
        if @id.present?
             redirect_to edit_contract_path(@id), notice: 'Detalle producto borrado correctamente', contract_product: :see_other
        else     
            redirect_to contract_products_path, notice: 'Detalle producto borrado correctamente', contract_product: :see_other
        end    
    end    

    def crear_cotizacion(contract_product)
        @pre_invoice =  PreInvoice.new
        @pre_invoice.date_creation = contract_product.date_initial
        #@pre_invoice.date_filing
        @pre_invoice.contract_id = contract_product.contract_id
        @pre_invoice.product_id = contract_product.product_id
        @pre_invoice.customer_id = @pre_invoice.contract.customer_id
        @pre_invoice.analyst_id = @pre_invoice.contract.analyst_id
        @pre_invoice.contract_product_id  = contract_product.id
        @pre_invoice.date_expiration = contract_product.date_initial.end_of_month
        #@pre_invoice.date_full_payment = 
        #@pre_invoice.date_last_payment
        #@pre_invoice.id_filing
        @pre_invoice.days_late = 0
        @pre_invoice.state = 0
        @pre_invoice.value_tax = 0
        @pre_invoice.value_discount = 0
        @pre_invoice.value_bruto = contract_product.cost if contract_product.factor == 0
        @pre_invoice.value_bruto = ((contract_product.sale_value * contract_product.percentage) / 100).round(2) if contract_product.factor == 1
        @pre_invoice.value_interest = 0
        @pre_invoice.value_others = 0
        @pre_invoice.value_neto = @pre_invoice.value_bruto + @pre_invoice.value_tax + @pre_invoice.value_interest + @pre_invoice.value_others - @pre_invoice.value_discount 
        @pre_invoice.total_balance = @pre_invoice.value_neto
        @pre_invoice.value_paid = 0
        @pre_invoice.user_pre_invoice = @pre_invoice.contract.analyst_id
        @pre_invoice.observations = PreInvoice.observaciones(@pre_invoice)
        @pre_invoice.save
    end
    
    
    private

    def contract_product_params
        params.require(:contract_product).permit(:factor, :periodicity, :cost, :date_initial, :date_final, :cod_product_inter, :id_product_inter, :contract_id, :product_id, 
        :sale_value, :percentage)
    end 

end    




