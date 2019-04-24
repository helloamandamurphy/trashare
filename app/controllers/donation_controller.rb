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
      @donation = Donation.new(params["donation"])
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
    @donation = Donation.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    erb :"donate/edit_donation"
  end

  patch '/donations/:id' do
    @donation = Donation.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    @donation.update(params["donation"])
    redirect "/donations/#{@donation.id}"
  end

  delete '/donations/:id/delete' do
    redirect_if_not_logged_in
    @donation = Donation.find_by(id: params[:id])
    redirect_if_no_permissions(@donation)
    @donation.delete
    redirect "/donations"
  end
end
