require 'rails_helper'

describe V1::ContactsController, :v1test, type: :controller do
    context "GET requests" do
        it 'returns 200 OK' do
            request.accept = 'application/json'
            get :index
            expect(response).to have_http_status(:ok)
        end
    end
end