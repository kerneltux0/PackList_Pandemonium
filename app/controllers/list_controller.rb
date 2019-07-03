class ListController < ApplicationController

  get '/list/new' do
    if logged_in?
      erb :'/list/new'
    else
      redirect '/'
    end

  end

  get '/list/index' do
    if logged_in?
      @lists = List.all
      erb :'/list/index'
    else
      redirect '/'
    end

  end
  
  get '/list/:id' do
    if logged_in?
      @list = List.find(params[:id])
      erb :'/list/show'
    else
      redirect '/'
    end

  end

  get '/list/:id/edit' do
    if logged_in?
      erb :'/list/edit'
    else
      redirect '/'
    end

  end

  get '/list/:id/delete' do
    if logged_in?
      erb :'/list/delete'
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
    else
      redirect '/'
    end

  end

  delete '/list/:id/delete' do
    @list = List.find()

  end
  
end