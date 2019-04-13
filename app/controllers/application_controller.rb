require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "trashare"
  end

  get '/' do
    erb :index
  end

  get '/marketplace' do
    erb :marketplace
  end

  get '/login' do
    erb :"login.html"
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/posts'
  end

  get '/logout' do
    logout!
    redirect '/posts'
  end

  helpers do

    def logged_in?
      session.clear
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:id]) if session[:id]
    end

    def login(email, password)
      user = User.find_by(id: params[:id])
      if user && user.authenticate(password)
        session[:id] = user.id
      else
        redirect '/login'
      end
    end
  end

end
