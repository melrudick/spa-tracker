class UsersController < ApplicationController

  # get '/users/:id' do
  #   if !logged_in?
  #     redirect '/users/login'
  #   end
  #
  #   @user = User.find(params[:user_id])
  #   if !@user.nil? && @user == current_user
  #     erb :'users/show'
  #   else
  #     redirect '/users/login'
  #   end
  # end
  #
  get '/signup' do
    if logged_in?
      redirect 'users/show'
    else
      erb :'users/new'
    end
    # if !session[:user_id]
    #   erb :'users/new'
    # else
    #   redirect to 'users/login'
    # end
  end

  post "/signup" do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect "users/show"
    end
  end
  #
  # post '/signup' do
  #   if params[:username] == "" || params[:password] == ""
  #     redirect to '/signup'
  #   else
  #     @user = User.create(:username => params[:username], :password => params[:password])
  #     session[:user_id] = @user.id
  #     redirect '/bags'
  #   end
  # end
  #
  get '/users/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/'
    end
  end
  #
  # post '/login' do
  #   user = User.find_by(:username => params[:username])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect "/bags"
  #   else
  #     redirect to '/signup'
  #   end
  # end
  #
  # get '/logout' do
  #   if session[:user_id] != nil
  #     session.destroy
  #     redirect to '/login'
  #   else
  #     redirect to '/'
  #   end
  # end

  # get '/users/:id' do
  #   @user = current_user
  #   @clients = @user.clients
  #   erb :'users/show'
  # end

end
