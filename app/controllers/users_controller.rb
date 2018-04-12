class UsersController < ApplicationController

  # GET: /let the user to go for the sign-in page---done
  get "/signin" do
    erb :"/users/index.html"
  end

  # GET: /let the user go for the sign-up page
  get "/signup" do
    erb :"/users/new.html"
  end

  # POST: /user_login
  post "/signin" do

    redirect "/signin"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
