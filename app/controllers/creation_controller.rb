class CreationController < ApplicationController

  get '/creations' do
    @creations = Creation.all
    erb :"create/index"
  end

  get '/creations/new' do
    redirect_if_not_logged_in
    erb :"create/new_creation"
  end

  post '/creations' do
    redirect_if_not_logged_in
    if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:directions].empty? || params[:tags].empty?
      redirect "creations/new"
    else
      @creation = Creation.new(title: params["title"], description: params["description"], image_url: params["image_url"], directions: params["directions"], tags: params["tags"])
      @creation.user_id = session[:user_id]
      @creation.save
      redirect "/creations/#{@creation.id}"
    end
  end

  get '/creations/:id' do
    @creation = Creation.find_by(id: params[:id])
    erb :"create/show_creation"
  end

  get '/creations/:id/edit' do
    redirect_if_not_logged_in
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    erb :"create/edit_creation"
  end

  patch '/creations/:id' do
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:directions].empty? || params[:tags].empty?
      redirect "/creations/#{@creation.id}/edit"
    else
      @creation.update(title: params["title"], description: params["description"], image_url: params["image_url"], directions: params["directions"], tags: params["tags"])
      redirect "/creations/#{@creation.id}"
    end
  end

  delete '/creations/:id/delete' do
    redirect_if_not_logged_in
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    @creation.delete
    redirect "/creations"
  end
end
