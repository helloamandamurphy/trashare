class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new.html"
  end

  post '/users' do
    @user = User.new(email: params["email"], password: params["password"], username: params["username"], first_name: params["first_name"], last_name: params["last_name"], user_image: params["user_image"])
    if @user.save
      session[:user_id] = @user.id
      redirect '/marketplace'
    else
      erb :"users/new.html"
    end
  end
end
