class RequestController < ApplicationController

  get '/requests' do
    @requests = Request.all
    @users = User.all

    erb :"request/index"
  end

  get '/requests/new' do
    redirect_if_not_logged_in
    erb :"request/new_request"
  end

  post '/requests' do
    @request = Request.new(title: params["title"], description: params["description"], tags: params["tags"])
    @request.user_id = session[:user_id]
    @request.post_time = Time.now
    @request.save

    redirect "/requests/#{@request.id}"
  end

  get '/requests/:id' do
    @request = Request.find_by(id: params[:id])
    erb :"request/show_request"
  end

  get '/requests/:id/edit' do
    redirect_if_not_logged_in
    if @request = current_user.requests.find_by(params[:id])
      erb :"request/edit_request"
    else
      redirect '/requests'
    end
  end

  patch '/requests/:id' do
    @request = Request.find_by(id: params[:id])
    if logged_in? && @request.user_id == current_user.id
      if params[:title].empty? || params[:description].empty? || params[:tags].empty?
        redirect "/requests/#{@request.id}/edit"
      else
        @request.update(title: params["title"], description: params["description"], tags: params["tags"])
        redirect "/requests/#{@request.id}"
      end
    end
  end

  delete '/requests/:id/delete' do
    redirect_if_not_logged_in
    @request = Request.find_by(id: params[:id])
    if @request && @request.user_id == current_user.id
      @request.delete
      redirect "/requests"
    else
      redirect "/requests/#{@request.id}"
    end
  end

  end
