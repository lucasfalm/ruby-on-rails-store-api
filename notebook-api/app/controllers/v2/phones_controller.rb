class PhonesController < ApplicationController
    #include ActionController::HttpAuthentication::Token::ControllerMethods	

    before_action :authenticate_user!
    before_action :set_contact, only: [:show, :update, :destroy, :create]

    def show
        render json: @contact.phones
    end

    def update
        phone = Phone.find(phone_params[:id])
  
        if phone.update(phone_params)
          render json: @contact.phones
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
    end

    def destroy
        phone = Phone.find(phone_params[:id])
        phone.destroy
    end

    def create
        phone = Phone.new(phone_params)
        @contact.phones << phone

        if @contact.save
          render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
       @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
    
    def authenticate
	    authenticate_or_request_with_http_token do |token, options|
	      #ActiveSupport::SecurityUtils.secure_compare(
		    #  ::Digest::SHA256.hexdigest(token),
		    #  ::Digest::SHA256.hexdigest(TOKEN)
        #)
        hmac_secret = 'secret'
        JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
      end
    end
end
