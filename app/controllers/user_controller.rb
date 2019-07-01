class UserController < ApplicationController

  get '/signup' do
    erb :'/users/new'

  end

  get '/login' do
    erb :'/users/login'
  
  end

  get '/home' do
    erb :'/users/home'

  end

  get '/user/delete' do
    erb :'/users/delete'

  end

  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      @user = User.new(username: params[:username], password_digest: params[:password])
      @user.save
      redirect '/login'
    else
      redirect '/signup'
    end

  end

  post '/login' do
    # binding.pry
    if params[:username] != "" && params[:password] != ""
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/home'
      end
    else
      redirect '/login'
    end

  end

  
end