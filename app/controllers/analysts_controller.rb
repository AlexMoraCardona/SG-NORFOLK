class AnalystsController < ApplicationController
    def index
            @analysts = Analyst.all 
    end    

    def new
      @analyst = Analyst.new  
    end    

    def create
        @analyst = Analyst.new(analyst_params)

        if @analyst.save then
            redirect_to analysts_path, notice: t('.created') 
        else
            render :new, analysts: :unprocessable_entity
        end    
    end    
 
    def edit
        @analyst = Analyst.find(params[:id])
    end
    
    def update
        @analyst = Analyst.find(params[:id])
        if @analyst.update(analyst_params)
            redirect_to analysts_path, notice: 'Analista actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @analyst = Analyst.find(params[:id])
        @analyst.destroy
        redirect_to analysts_path, notice: 'Analista borrado correctamente', analyst: :see_other
    end    

    private

    def analyst_params
        params.require(:analyst).permit(:name, :document, :email, :cellular, :phone, :country)
    end 

end    
