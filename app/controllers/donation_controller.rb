class DonationController < ApplicationController

  get '/donations' do
    @donations = Donation.all
    @users = User.all

    erb :"donate/index"
  end

  get '/donations/new' do
    #if !logged_in?
      #redirect "/login"
    #else
      erb :"donate/new_donation"
    #end
  end

  post '/donations' do
    @donation = Donation.new(title: params["title"], description: params["description"], image_url: params["image_url"], address: params["address"], tags: params["tags"])
    @donation.user_id = session[:user_id]
    @donation.post_time = Time.now
    @donation.save

    redirect "/donations/#{@donation.id}"
  end

  get '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    #if !logged_in?
      #redirect "/login"
    #else
      #if @donation = current_user.donation.find_by(params[:id])
        erb :"donate/show_donation"
      #else
        #redirect '/donations'
      #end
    #end
  end

  get '/donations/:id/edit' do
    #if !logged_in?
      #redirect "/login"
    #else
      #if @donation = current_user.donation.find_by(params[:id])
      @donation = Donation.find_by(id: params[:id])
        erb :"donate/edit_donation"
      #else
        #redirect '/donations'
      #end
    #end
  end

  patch '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    #if logged_in? && @donation.user_id == current_user.id
      #if params[:content].empty?
        #redirect "/donations/#{@donation.id}/edit"
      #else
        @donation.update(title: params["title"], description: params["description"], image_url: params["image_url"], address: params["address"], tags: params["tags"])
        redirect to "/donations/#{@donation.id}"
      #end
    #else
      #erb :login
    #end
  end

  delete '/donations/:id/delete' do
    #if logged_in?
    @donation = Donation.find_by(id: params[:id])
      #if @donation && @donation.user_id == current_user.id
        @donation.delete
      #end
      redirect to '/donations'
    #else
      #redirect to '/login'
    #end
  end

end
