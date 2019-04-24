class SupplyController < ApplicationController

  get '/supplies' do
    @supplies = Supply.all
    erb :"supply/index"
  end

  get '/supplies/new' do
    redirect_if_not_logged_in
    erb :"supply/new_supply"
  end

  post '/supplies' do
    redirect_if_not_logged_in
    @supply = Supply.new(params["supply"])
    @supply.user_id = session[:user_id]
    @supply.post_time = Time.now
    @supply.save
    redirect "/supplies/#{@supply.id}"
  end

  get '/supplies/:id' do
    @supply = Supply.find_by(id: params[:id])
    erb :"supply/show_supply"
  end

  get '/supplies/:id/edit' do
    redirect_if_not_logged_in
    @supply = Supply.find_by(id: params[:id])
    redirect_if_no_permissions(@supply)
    erb :"supply/edit_supply"
  end

  patch '/supplies/:id' do
    @supply = Supply.find_by(id: params[:id])
    redirect_if_no_permissions(@supply)
    @supply.update(params["supply"])
    redirect "/supplies/#{@supply.id}"
  end

  delete '/supplies/:id/delete' do
    redirect_if_not_logged_in
    @supply = Supply.find_by(id: params[:id])
    redirect_if_no_permissions(@supply)
    @supply.delete
    redirect "/supplies"
  end
end
