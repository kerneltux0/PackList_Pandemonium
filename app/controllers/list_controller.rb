class ListController < ApplicationController

  get '/lists/new' do
    erb :'/list/new'

  end

  get '/lists/index' do
    erb :'/list/index'

  end
  
  get '/lists/:id' do
    @list = params[:id]
    erb :'/list/show'

  end

  get '/lists/:id/edit' do
    erb :'/list/edit'

  end

  get '/lists/:id/delete' do
    erb :'/list/delete'

  end

  post '/lists/new' do
    binding.pry

  end
  
end