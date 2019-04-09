class RequestController < ApplicationController

  get '/requests/new' do
    #if !logged_in?
      #redirect "/login"
    #else
      erb :"request/new_request"
    #end
  end

  #post '/creations' do
    #@request = Request.new(:key params(key))
  #end

  get '/requests' do
    erb :"request/index"
  end

  get '/requests/:id' do
    #if !logged_in?
      #redirect "/login"
    #else
      #if @request = current_user.request.find_by(params[:id])
        erb :"request/show_request"
      #else
        #redirect '/requests'
      #end
    #end
  end

  get '/requests/:id/edit' do
    #if !logged_in?
      #redirect "/login"
    #else
      #if @request = current_user.request.find_by(params[:id])
        erb :"request/edit_request"
      #else
        #redirect '/requests'
      #end
    #end
  end
end
