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
      @list = params[:id]
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
    @user = User.find(session[:user_id])
    binding.pry
    @list = List.new(name: params[:name])
    @user.lists << @list
    @list.user_id = @user.id
    params[:item].each do |name,enabled|
      @item = Item.new(name: name)
      @item.save
      @list.items << @item
    end
    @list.save
    # if logged_in?
    #   erb :'/list/new'
    # else
    #   redirect '/'
    # end

  end
  
end