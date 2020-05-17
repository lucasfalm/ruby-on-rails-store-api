require 'rails_helper'

class Hash
    def json(parts)
        ary = parts.split(">")
        ary.reduce(self) do |memo, key|
            memo.fetch(key.to_s.strip) if memo
        end
    end
end
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

            expect(response_body.json('data > id').to_i).to eql(contact.id)
        end
    end
end