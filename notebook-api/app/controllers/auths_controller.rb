class AuthsController < ApplicationController
  def create
    hmac_secret = 'secret'
    payload = { name: params[:name] }
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json: { token: token }
    # example: 
    # curl 'localhost:3000/auths' -d "name=Lucas" -H 'Accept: application/json' -X POST 
  end
end
