class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new.html"
  end

  post '/users' do
    @user = User.new
    @user.email = params["email"]
    @user.password = params["password"]
    @user.username = params["username"]
    @user.first_name = params["first_name"]
    @user.last_name = params["last_name"]
    @user.user_image = params["user_image"]
    if @user.save
      redirect "/login"
    else
      erb :"users/new.html"
    end
  end
end
