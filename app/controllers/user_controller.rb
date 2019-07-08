# Copyright 2019, Ryan Sise

# This file is part of PackList Pandemonium.

# PackList Pandemonium is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# PackList Pandemonium is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with PackList Pandemonium.  If not, see <https://www.gnu.org/licenses/>.

class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/user/new'
    else
      redirect '/home'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/user/login'
    else
      redirect '/home'
    end
  end

  get '/home' do
    if logged_in?
      @user = User.find(session[:user_id])
      erb :'/user/home'
    else
      redirect '/'
    end
  end

  get '/user/delete' do
    if logged_in?
      @user = User.find(session[:user_id])
      erb :'/user/delete'
    else
      redirect '/'
    end
  end

  post '/signup' do
    if !logged_in?

      if params[:username] != "" && params[:password] != ""
        @user = User.new(username: params[:username], password: params[:password])
        @user.save
        redirect '/login'
      else
        redirect '/signup'
      end

    else
      redirect '/home'
    end
  end

  post '/login' do
    if !logged_in?

      if params[:username] != "" && params[:password] != ""
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/home'
        else
          redirect '/'
        end
      else
        redirect '/login'
      end

    else
      redirect '/home'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  delete '/user/delete' do
    if logged_in?

      if params[:delete_acct] == "on"
        @user = User.find(session[:user_id])
        session.clear
        @user.destroy
        erb :'/user/delete_conf'
      else
        erb :'/user/delete_incomp'
      end

    else
      redirect '/'
    end
  end
  
end