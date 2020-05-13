class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]
    def show
        render json: @address
    end
    def update
        if @address.update(address_params)
            render json: @address
        else
            render json: @address.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @address.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
        @address = Contact.find(params[:contact_id]).address
    end

    def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
