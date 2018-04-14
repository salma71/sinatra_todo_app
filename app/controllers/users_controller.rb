class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/show.html'
  end
  # GET: /let the user to go for the sign-in page --done
  get "/signin" do
    erb :"/users/signin.html"
  end

  # GET: /let the user go for the sign-up page --done
  get "/signup" do
    erb :"/users/new.html"
  end

  # POST: /send the sign-in info to the server and let the user to login
  post "/signin" do
    @user = User.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/todos'
    else
      redirect "/signup"
    end
  end
  #POST:/send the signup infor to the serverand let the user to create account
  post "/signup" do
    # if one of the entry field is empty direct to the signup page
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"
    else
      #else create a new instance of user using params
      # set session[:user_id] to newly created user id
      #finally redirect the user to the todos list page
      # binding.pry
      # @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
      # # binding.pry
      # session[:user_id] = @user.id
      @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
      # @user.save
      session[:user_id] = @user.id
      redirect "/todos"
    end
  end
  get "/signout" do
    #if the user is logged in then clear the session and redirect to the /signin page
    #else redirect to the /index page
    if signed_in?
      session.destroy
      redirect "/signin"
    else
      redirect "/index"
    end
  end
  # GET: /users/5 show a user with specific id
  get "/users/:id" do
    #if the user is signed in
    @user = User.find(params[:id])
    erb :"/users/edit.html"
  end
  patch "/users/:id" do
    # raise params.inspect
    # fins the todo with the specific id
    @user = User.find(params[:id])
    # binding.pry
    @user.update(name: params[:name], email: params[:email])
    # binding.pry
      redirect "/users/#{@user.id}"
  end
  # get "/todos/:id" do
  #   todo = Todo.find(params[:id])
  #     erb :'/todos/edit.html'
  # end
  #
  # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end
  ###########

  #
  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end
  #
  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
