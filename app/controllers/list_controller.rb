class ListController < ApplicationController

  get '/list/new' do
    erb :'/list/new'

  end

  get '/list/index' do
    erb :'/list/index'

  end
  
  get '/list/:id' do
    @list = params[:id]
    erb :'/list/show'

  end

  get '/list/:id/edit' do
    erb :'/list/edit'

  end

  get '/list/:id/delete' do
    erb :'/list/delete'

  end

  post '/list/new' do
    binding.pry

  end
  
end