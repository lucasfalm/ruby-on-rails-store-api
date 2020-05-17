require 'rails_helper'

describe V1::ContactsController, :v1test, type: :controller do
    context "GET requests" do
        it 'request index and returns 200 OK' do
            request.accept = 'application/json'
            get :index
            expect(response.status).to eql(200)
        end
    end
end