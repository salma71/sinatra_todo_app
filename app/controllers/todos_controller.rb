class TodosController < ApplicationController

  # GET: /todos
  get "/todos" do
    if signed_in?
      @todos = Todo.all
      redirect "/todos/todos"
    else
      redirect "/signin"
    end


  end

  # GET: /todos/new
  get "/todos/new" do
    if signed_in?
      erb :"/todos/new.html"
    else
      redirect "/signin"
    end
  end

  # POST: /todos
  post "/todos" do
    if signed_in?
      if params[:chore].empty?
        redirect "/todos/new"
      else
        @user = User.find_by(:id => session[:user_id])
        @todo = Todo.create(chore: params[:chore], user_id: @user.id)
        redirect "/todos"
      end
    else
      redirect "/signin"
    end

  end

  # GET: /todos/5
  get "/todos/:id" do
    erb :"/todos/show.html"
  end

  # GET: /todos/5/edit
  get "/todos/:id/edit" do
    erb :"/todos/edit.html"
  end

  # PATCH: /todos/5
  patch "/todos/:id" do
    redirect "/todos/:id"
  end

  # DELETE: /todos/5/delete
  delete "/todos/:id/delete" do
    redirect "/todos"
  end
end
