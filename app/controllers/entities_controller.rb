class EntitiesController < ApplicationController
    def index
            @entities = Entity.all
    end    

    def new
      @entity = Entity.new  
    end    

    def create 
        @entity = Entity.new(entity_params) 

        if @entity.save then
            redirect_to entities_path, notice: t('.created') 
        else
            render :new, status: :unprocessable_entity, alert: 'Se presento error en la creación de la entidad'
        end   
        
    end    
 
    def edit
        @entity = Entity.find(params[:id])
    end
    
    def update
        @entity = Entity.find(params[:id])
        
        if @entity.update(entity_params)
            
            redirect_to entities_path, notice: 'Empresa actualizada correctamente'
        else
            
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @entity = Entity.find(params[:id])
        @entity.destroy
        redirect_to entities_path, notice: 'Empresa borrada correctamente', entity: :see_other
    end    

    private

    def entity_params
        params.require(:entity).permit(:name, :address, :phone, :email, :banco, 
        :type_count, :number_count, :logo, :name_count, :address_completa, :document_entity, :token)
    end 

end  

