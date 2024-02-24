class ContactsController < ApplicationController
    def index
            @levels = Contact.all 
    end    

    def show
        if Current.user && Current.user.level < 3 && Current.user.level > 0 then
            @contact = Contact.find(params[:id].to_i) if params[:id].present?
        end    
    end  

    private
    def level_params
        params.require(:level).permit(:id_interno, :name_contact, :qualification, 
        :personal_email, :work_email, :address, :city, :pulled_apart, :country, 
        :website, :fax, :company, :position, :deparment, :agent, :birthDate, 
        :portal_Access,  :portal_User, :portal_Pass, :portal_Profile, 
        :portal_emaill, :state, :phone_1, :phone_2, :cellular, :customer_id)
    end 

end 


