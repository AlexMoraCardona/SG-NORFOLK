class Authentication::UsersController < ApplicationController
    skip_before_action :protect_pages
    
    def index
        if  Current.user && Current.user.level == 1
           @users = User.all
        else
            redirect_to new_session_path, alert: t('common.not_logged_in')      
        end    
    end    
 
    
    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id  
            @entity = Entity.find(Current.user.entity_id) if Current.user.entity_id.present?
            redirect_to levels_path, notice: 'Usuario creado correctamente'
        else
            render :new, status: :unprocessable_entity
        end     
    end   
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @entity = Entity.find(@user.entity_id) if @user.entity_id.present?

        if @user.update(user_params)
            redirect_to users_path, notice: 'Usuario actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end         
    end    

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: 'Usuario borrado correctamente', user: :see_other
    end    
    
    def cambioempresa
        @entity = Entity.find(Current.user.entity_id) if urrent.user.entity_id.present?
    end    
    private
    def user_params
        params.require(:user).permit(:nro_document, :name, :username, :email, :password, :state, :level, :activity, :avatar, :entity_id)
    end    
end  

