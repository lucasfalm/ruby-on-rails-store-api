require 'rails_helper'

describe V1::ContactsController, :v1test, type: :controller do
    context "GET requests" do
        it 'index - returns 200 OK' do
            request.accept = 'application/json'
            get :index
            expect(response).to have_http_status(:ok)
        end
        it 'show - returns 200 OK' do
            request.accept = 'application/json'
            contact = Contact.first
            get :show, :params => { id: contact.id }
            response_body = JSON.parse(response.body)

            expect((response_body.fetch('data').fetch('id')).to_i).to eql(contact.id)
        end
    end
end