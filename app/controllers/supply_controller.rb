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
    @supply = Supply.new(title: params["title"], description: params["description"], tags: params["tags"])
    @supply.user_id = current_user.id
    @supply.post_time = Time.now
    @supply.save

    if @supply.save
      redirect "/supplies/#{@supply.id}"
    else
      erb :"supply/new_supply"
    end
  end

  get '/supplies/:id' do
    @supply = Supply.find_by(id: params[:id])
    erb :"supply/show_supply"
  end

  get '/supplies/:id/edit' do
    redirect_if_not_logged_in
    if @supply = current_user.supplies.find_by(params[:id])
      erb :"supply/edit_supply"
    else
      redirect '/supplies'
    end
  end

  patch '/supplies/:id' do
    @supply = Supply.find_by(id: params[:id])
    if logged_in? && @supply.user_id == current_user.id
      if params[:title].empty? || params[:description].empty? || params[:tags].empty?
        redirect "/supplies/#{@supply.id}/edit"
      else
        @supply.update(title: params["title"], description: params["description"], tags: params["tags"])
        redirect "/supplies/#{@supply.id}"
      end
    end
  end

  delete '/supplies/:id/delete' do
    redirect_if_not_logged_in
    @supply = Supply.find_by(id: params[:id])
    if @supply && @supply.user_id == current_user.id
      @supply.delete
      redirect "/supplies"
    else
      redirect "/supplies/#{@supply.id}"
    end
  end
end
