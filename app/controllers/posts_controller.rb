class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
  end
end
