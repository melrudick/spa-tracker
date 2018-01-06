class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect 'users/show'
    else
      erb :'users/new'
    end
  end

  post "/signup" do
    if params[:username].empty? || params[:password].empty?
      redirect 'users/new'
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/'
    end
  end

  get "/users/:id" do
    @user = current_user
    erb :'users/show'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      redirect to '/login'
    end
  end



  # @user.clients


end
