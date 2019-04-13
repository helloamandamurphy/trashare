class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new.html"
  end

  post '/users' do
    @user = User.new(email: params["email"], password: params["password"], username: params["username"], first_name: params["first_name"], last_name: params["last_name"], user_image: params["user_image"])
    @user.save
    redirect "/donations"
  end
end
