class DonationController < ApplicationController

  get '/donations' do
    @donations = Donation.all.reverse
    erb :"donate/index"
  end

  get '/donations/new' do
    redirect_if_not_logged_in
    erb :"donate/new_donation"
  end

  post '/donations' do
    redirect_if_not_logged_in
    if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:address].empty? || params[:tags].empty?
      redirect "donations/new"
    else
      @donation = Donation.new(title: params["title"], description: params["description"], image_url: params["image_url"], address: params["address"], tags: params["tags"])
      @donation.user_id = session[:user_id]
      @donation.post_time = Time.now
      @donation.save
      redirect "/donations/#{@donation.id}"
    end
  end

  get '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    erb :"donate/show_donation"
  end

  get '/donations/:id/edit' do
    redirect_if_not_logged_in
    @donation = Supply.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    erb :"donate/edit_donation"
  end

  patch '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    if params[:title].empty? || params[:description].empty? || params[:image_url].empty? || params[:address].empty? || params[:tags].empty?
      redirect "/donations/#{@donation.id}/edit"
    else
      @donation.update(title: params["title"], description: params["description"], image_url: params["image_url"], address: params["address"], tags: params["tags"])
      redirect "/donations/#{@donation.id}"
    end
  end

  delete '/donations/:id/delete' do
    redirect_if_not_logged_in
    @donation = Donation.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    @donation.delete
    redirect "/donations"
  end
end
