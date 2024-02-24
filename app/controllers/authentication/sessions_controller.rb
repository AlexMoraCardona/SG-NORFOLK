class Authentication::SessionsController < ApplicationController
    skip_before_action :protect_pages
    
    def new
        #@entity = Entity.find(Current.user.entity_id) if Current.user.entity_id.present?
    end

    def create
        @user = User.find_by("(email = :login OR username = :login) AND state = 1 ", { login: params[:login]})
        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            #@entity = Entity.find(Current.user.entity_id) if Current.user.entity_id.present?
            redirect_to home_path, notice: t('.created')
        else
            redirect_to new_session_path, alert: t('.failed')
        end     
    end  
    
    def destroy
        session.delete(:user_id)
        redirect_to new_session_path, notice: t('.destroyed')
    end     
    
end     
