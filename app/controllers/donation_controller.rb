class DonationController < ApplicationController

  get '/donations' do
    @donations = Donation.all
    @users = User.all

    erb :"donate/index"
  end

  get '/donations/new' do
    redirect_if_not_logged_in
    erb :"donate/new_donation"
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
    erb :"donate/show_donation"
  end

  get '/donations/:id/edit' do
    redirect_if_not_logged_in
    if @donation = current_user.donations.find_by(params[:id])
      erb :"donate/edit_donation"
    else
      redirect '/donations'
    end
  end

  patch '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    if logged_in? && @donation.user_id == current_user.id
      if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:address].empty? || params[:tags].empty?
        redirect "/donations/#{@donation.id}/edit"
      else
        @donation.update(title: params["title"], description: params["description"], image_url: params["image_url"], address: params["address"], tags: params["tags"])
        redirect "/donations/#{@donation.id}"
      end
    end
  end

  delete '/donations/:id/delete' do
    redirect_if_not_logged_in
    @donation = Donation.find_by(id: params[:id])
    if @donation && @donation.user_id == current_user.id
      @donation.delete
      redirect "/donations"
    else
      redirect "/donations/#{@donation.id}"
    end
  end

end
