class TodosController < ApplicationController
  # GET: /todos asking the server for the data in todo -- done
  get "/todos" do
    # if the user is signed in?
    if signed_in?
      # then find the user who's session params = to user_id
      @user = User.find(session[:user_id])
      # finally disply the todo list where user_id = to current user

        @todos = Todo.where(user_id: current_user)
        # binding.pry
        erb :"todos/index.html"
    else
      redirect "/signin"
    end
  end

  # GET: /todos/new -- done
  get "/todos/new" do
    if signed_in?
      @user = User.find_by(id: session[:user_id])
      erb :"/todos/new.html"
    else
      redirect "/signin"
    end
  end

  # POST: /todos --- done
  post "/todos" do
    # raise params.inspect
    #params {"chore"=>"raise params inspect"}
    if signed_in?
      @user = User.find(session[:user_id])
      # binding.pry

      if params[:chore].empty?
        redirect "/todos/new"
      else
        @user = User.find_by(:id => session[:user_id])
        # create new instance of todo
        @todo = Todo.new
        # set the name of chore
        @todo.chore = params[:chore]
        # finally save it
        @todo.user_id = @user.id
        @todo.save

        # todo = Todo.create(chore: params[:chore], user_id: @user.id)
        # redirect to the show page, HTTP is stateless means instance variable in one action
        # will ever never relates to instance variable in another action
        # ser the todo id to the propeer one
        redirect "/todos"
      end
    else
      redirect "/signin"
    end
  end
  get '/todos/:id' do
    if signed_in?
      @todo = Todo.find(params[:id])
      # binding.pry
      erb :'/todos/show.html'
    else
      redirect '/signin'
    end
  end
  # GET: /todos/5
  get "/todos/:id/edit" do
    @user = User.find_by(id: session[:user_id])
    @todo = Todo.find(params[:id])
    if @todo && @todo.user == current_user

    # there is no relation between this line and line 37 it just bcz of redirecting due to design
    # those two values are the end up equals
    erb :"/todos/edit.html"
    else
      redirect "/signin"
    end
  end
  patch '/todos/:id' do
    if signed_in?
      if params[:chore].empty?
        redirect "/todos/#{params[:id]}/edit"
      else
        @todo = Todo.find_by_id(params[:id])
        if @todo && @todo.user == current_user
          if @todo.update(:chore => params[:chore])
            redirect to "/todos/#{@todo.id}"
          else
          redirect to "/todos/#{@todo.id}/edit"
          end
        else
          redirect to '/todos'
        end
      end
    else
      redirect '/signin'
    end
  end

  delete '/todos/:id/delete' do
   if signed_in?
     @user = User.find_by(id: session[:user_id]) if session[:user_id]
     @todo = Todo.find_by_id(params[:id])
     # binding.pry
     if @todo && @todo.user == current_user
       @todo.delete
       redirect '/todos'
     end
   #   redirect to '/todos'
   else
     redirect to '/signin'
   end
 end
end
