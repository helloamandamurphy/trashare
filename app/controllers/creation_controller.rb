class CreationController < ApplicationController

  get '/creations/new' do
    #if !logged_in?
      #redirect "/login"
    #else
      erb :"create/new_creation"
    #end
  end

  #post '/creations' do
    #@creation = Creation.new(:key params(key))
  #end

  get '/creations' do
    erb :"create/index"
  end

  get '/creations/:id' do
    #if !logged_in?
      #redirect "/login"
    #else
      #if @creation = current_user.creation.find_by(params[:id])
        erb :"create/show_creation"
      #else
        #redirect '/creations'
      #end
    #end
  end

  get '/creations/:id/edit' do
    #if !logged_in?
      #redirect "/login"
    #else
      #if @creation = current_user.creation.find_by(params[:id])
        erb :"create/edit_creation"
      #else
        #redirect '/creations'
      #end
    #end
  end
end
