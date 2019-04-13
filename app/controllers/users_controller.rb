class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new.html"
  end

  post '/users' do
    @user = User.new(email: params["email"], password: params["password"], username: params["username"], first_name: params["first_name"], last_name: params["last_name"], user_image: params["user_image"])

    redirect "/donations"
  end

  get '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/new.html"
    end
  end

end
