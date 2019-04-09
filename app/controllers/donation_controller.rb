class DonationController < ApplicationController

  get '/donations/new' do
    #if !logged_in?
      #redirect "/login"
    #else
      erb :"donate/new_donation"
    #end
  end

  #post '/donations' do
    #@donation = Donation.new(:key params(key))
  #end

  get '/donations' do
    erb :"donate/index"
  end

  get '/donations/:id' do
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
        erb :"donate/edit_donation"
      #else
        #redirect '/donations'
      #end
    #end
  end

end
