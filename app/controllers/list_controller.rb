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
    binding.pry

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