class PostsController < ApplicationController

  get '/posts' do
    "A list of publically available posts"
  end

  get '/posts/new' do
    if !session[:email]
      redirect "/login"
    else
      "A new post form"
    end
  end
end
