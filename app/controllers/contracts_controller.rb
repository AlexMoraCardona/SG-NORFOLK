class ContractsController < ApplicationController
    def index
            @contracts = Contract.all 
    end    

    def new
      @contract = Contract.new  
    end    

    def create
        @contract = Contract.new(contract_params)

        if @contract.save then
            redirect_to edit_contract_path(@contract.id), notice: t('.created')  
        else
            render :new, contracts: :unprocessable_entity
        end    
    end    
 
    def edit
        @contract = Contract.find(params[:id])
        @contract_products = ContractProduct.where("contract_id = ?",@contract.id) if @contract.present?
    end
    
    def update
        @contract = Contract.find(params[:id])
        if @contract.update(contract_params)
            redirect_to customer_path(@contract.customer_id), notice: 'Contrato actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @contract = Contract.find(params[:id])
        @contract.destroy
        redirect_to contracts_path, notice: 'Nivel borrado correctamente', contract: :see_other
    end    

    def crear_contrato 
        @contract = Contract.new  
    end  

    def crear_contrato_producto 
        @contract_product = ContractProduct.new  
    end  

    private

    def contract_params
        params.require(:contract).permit(:name_project, :name_promotora, :classification, 
        :cost_center_interfuerza, :id_cost_center_interfuerza, :customer_id, :analyst_id, 
        :status_contract)
    end 

end    

