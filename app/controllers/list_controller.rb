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

class ListController < ApplicationController

  get '/list/new' do
    if logged_in?
      @general = BaseList.general
      @electronics = BaseList.electronics
      @camping = BaseList.camping
      @toiletries = BaseList.toiletries
      @clothing = BaseList.clothing
      erb :'/list/new'
    else
      redirect '/'
    end

  end

  get '/list/index' do
    if logged_in?
      @user = User.find(session[:user_id])
      @lists = @user.lists
      erb :'/list/index'
    else
      redirect '/'
    end

  end
  
  get '/list/:id' do
    if logged_in?
      @list = List.find(params[:id])
      @user = User.find(session[:user_id])
      if @list.user_id == @user.id
        erb :'/list/show'
      else
        redirect '/home'
      end
    else
      redirect '/'
    end

  end

  get '/list/:id/edit' do
    if logged_in?
      @general = BaseList.general
      @electronics = BaseList.electronics
      @camping = BaseList.camping
      @toiletries = BaseList.toiletries
      @clothing = BaseList.clothing

      @list = List.find(params[:id])
      @user = User.find(session[:user_id])

      @lists = []
      @list.items.each do |item_obj|
        @lists << item_obj.name
      end

      if @list.user_id == @user.id
        erb :'/list/edit'
      else
        redirect '/home'
      end
    else
      redirect '/'
    end

  end

  patch '/list/:id/edit' do
    if logged_in?
      @user = User.find(session[:user_id])
      @list = List.find(params[:id])
      @list.items.clear
      params[:item].each do |name,enabled|
        @item = Item.create(name: name)
        @list.items << @item
        @item.save
      end
      @list.save
      redirect "/list/#{@list.id}"
    else
      redirect '/'
    end

  end

  get '/list/:id/delete' do
    if logged_in?
      @list = List.find(params[:id])
      @user = User.find(session[:user_id])
      if @list.user_id == @user.id
        erb :'/list/delete'
      else
        redirect '/home'
      end
    else
      redirect '/'
    end

  end

  post '/list/new' do
    if logged_in?
      @user = User.find(session[:user_id])
      @list = List.create(name: params[:name])
      @user.lists << @list
      @user.save
      params[:item].each do |name,enabled|
        @item = Item.create(name: name)
        @list.items << @item
        @item.save
      end
      @list.save
      redirect '/home'
    else
      redirect '/'
    end

  end

  delete '/list/:id/delete' do
    if logged_in?
      @list = List.find(params[:id])
      @user = User.find(session[:user_id])
      if @list.user_id == @user.id
        if params[:verify] == "on"
          @list = List.find(params[:id])
          @list.destroy
          erb :'/list/delete_conf'
        else
          erb :'/list/delete_incomp'
        end
      else
        redirect '/home'
      end
    else
      redirect '/'
    end

  end
  
end