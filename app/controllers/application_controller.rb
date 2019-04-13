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
    redirect '/marketplace'
  end

  get '/logout' do
    logout!
    redirect '/marketplace'
  end

  helpers do

    def logged_in?
      session.clear
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
        #add flash message "Please login to access that feature."
      end
    end

    def login(email, password)
      user = User.find_by(email: params[:email])
      if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end
  end

end
