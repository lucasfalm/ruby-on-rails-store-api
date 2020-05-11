class PhonesController < ApplicationController
    before_action :set_phones, only: [:show]
    def show
        render json: @phones
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_phones
        if params[:contact_id]
          @phones = Contact.find(params[:contact_id]).phones
        else
          @phones = Phones.where(id: params[:id])
        end
    end
end
