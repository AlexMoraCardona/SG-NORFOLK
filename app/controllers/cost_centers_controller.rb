class CostCentersController < ApplicationController
    def index
            @cost_centers = CostCenter.all 
    end    

    def new
      @cost_center = CostCenter.new  
    end    

    def create
        @cost_center = CostCenter.new(cost_center_params)

        if @cost_center.save then
            redirect_to cost_centers_path, notice: t('.created') 
        else
            render :new, cost_centers: :unprocessable_entity
        end    
    end    
 
    def edit
        @cost_center = CostCenter.find(params[:id])
    end
    
    def update
        @cost_center = CostCenter.find(params[:id])
        if @cost_center.update(cost_center_params)
            redirect_to cost_centers_path, notice: 'Centro de costos actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @cost_center = CostCenter.find(params[:id])
        @cost_center.destroy
        redirect_to cost_centers_path, notice: 'Centro de costos borrado correctamente', cost_center: :see_other
    end    

    private

    def cost_center_params
        params.require(:cost_center).permit(:id_interno, :id_interfuerza, :name, :description, :inactive)
    end 

end    

 
