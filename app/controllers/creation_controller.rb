class CreationController < ApplicationController

  get '/creations' do
    @creations = Creation.all
    @users = User.all

    erb :"create/index"
  end

  get '/creations/new' do
    redirect_if_not_logged_in
    erb :"create/new_creation"
  end

  post '/creations' do
    @creation = Creation.new(title: params["title"], description: params["description"], image_url: params["image_url"], directions: params["directions"], tags: params["tags"])
    @creation.user_id = session[:user_id]
    @creation.save

    redirect "/creations/#{@creation.id}"
  end

  get '/creations/:id' do
    @creation = Creation.find_by(id: params[:id])
    erb :"create/show_creation"
  end

  get '/creations/:id/edit' do
    redirect_if_not_logged_in
    if @creation = current_user.creations.find_by(params[:id])
      erb :"create/edit_creation"
    else
      redirect '/creations'
    end
  end

  patch '/creations/:id' do
    @creation = Creation.find_by(id: params[:id])
    if logged_in? && @creation.user_id == current_user.id
      if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:directions].empty? || params[:tags].empty?
        redirect "/creations/#{@creation.id}/edit"
      else
        @creation.update(title: params["title"], description: params["description"], image_url: params["image_url"], directions: params["directions"], tags: params["tags"])
        redirect "/creations/#{@creation.id}"
      end
    end
  end

  delete '/creations/:id/delete' do
    redirect_if_not_logged_in
    @creation = Creation.find_by(id: params[:id])
    if @creation && @creation.user_id == current_user.id
      @creation.delete
      redirect "/creations"
    else
      redirect "/creations/#{@creation.id}"
    end
  end

end
