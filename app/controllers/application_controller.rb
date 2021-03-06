require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "trashare"
    use Rack::Flash
  end

  get '/' do
    @creation = Creation.last
    erb :index
  end

  get '/marketplace' do
    @supply = Supply.last
    @donations = Donation.last(3).reverse

    erb :marketplace
  end

  get '/login' do
    if !logged_in?
      erb :"login.html"
    else
      redirect "/marketplace"
    end
  end

  post '/sessions' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/marketplace'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/marketplace'
    else
      flash[:message] = "You are not currently logged in."
      redirect '/login'
    end
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "Please login to access that feature."
        redirect '/login'
      end
    end

    def redirect_if_no_permissions(post)
      if !post || post.user_id != current_user.id
        redirect "/marketplace"
      end
    end
  end
end
