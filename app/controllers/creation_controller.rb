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
    @creation = Creation.new(params["creation"])
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
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    erb :"create/edit_creation"
  end

  patch '/creations/:id' do
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    @creation.update(params["creation"])
    redirect "/creations/#{@creation.id}"
  end

  delete '/creations/:id/delete' do
    redirect_if_not_logged_in
    @creation = Creation.find_by(id: params[:id])
    redirect_if_no_permissions(@creation)
    @creation.delete
    redirect "/creations"
  end
end
