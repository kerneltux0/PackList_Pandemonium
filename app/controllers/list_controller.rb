class ListController < ApplicationController

  get '/lists/new' do
    erb :'/lists/new'

  end

  get '/lists/index' do
    erb :'/lists/index'

  end
  
  get '/lists/:id' do
    @list = params[:id]
    erb :'/lists/show'

  end

  get '/lists/:id/edit' do
    erb :'/lists/edit'

  end

  get '/lists/:id/delete' do
    erb :'/lists/delete'

  end

  post '/lists/new' do
    binding.pry

  end
  
end