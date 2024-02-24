class CustomersController < ApplicationController
    def index
        if  Current.user && Current.user.level == 1
            @customers = Customer.all
         else
             redirect_to new_session_path, alert: t('common.not_logged_in')      
         end           
         
    end    

    def new
      @customer = Customer.new  
    end    

    def create
        @customer = Customer.new(customer_params)

        if @customer.save then
            redirect_to customers_path, notice: t('.created') 
        else
            render :edit, status: :unprocessable_entity
        end    
    end    
 
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to customers_path, notice: 'Cliente actualizado correctamente'
        else
            render :edit, customers: :unprocessable_entity
        end         
    end  
    
    def show
        if Current.user && Current.user.level < 3 && Current.user.level > 0 then
            @customer = Customer.find(params[:id].to_i) if params[:id].present?
            @contacts = Contact.where("customer_id = ?", @customer.id) if @customer.present?
            @contracts = Contract.where("customer_id = ? and status_contract <> ?", @customer.id, 'ELIMINADO') if @customer.present?  
            @pre_invoices = PreInvoice.where("customer_id = ?", @customer.id) if @customer.present?  

        end    
    end    

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to customers_path, notice: 'Cliente borrado correctamente', customer: :see_other
    end    

    private

    def customer_params
        params.require(:customer).permit(:customer_name, :customer_class, :taxpayer_type, :name, :ruc, :dv, :category, :priority, 
        :employees, :industry, :birth_date, :taxes, :status, :cellular, :website, :address, :city, :state, 
        :country, :email, :phone_1, :phone_2, :credit_term, :due_days, :credit_amount_limit, :points_program, 
        :account_receivable, :account_receivable_client, :balance, :name_project, :name_promotora, :email_1, :email_2, 
        :email_3, :email_4, :email_5, :email_6, :email_7, :email_8, :email_9, :email_10, :cost_center_id, :entity_id)
    end 

end  



