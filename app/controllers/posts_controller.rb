class PostsController < ApplicationController

  get '/posts' do
    "A list of publically available posts"
  end

  get '/posts/new' do
    if !logged_in?
      redirect "/login"
    else
      "A new post form"
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      "An edit post form"
    end
  end
end
