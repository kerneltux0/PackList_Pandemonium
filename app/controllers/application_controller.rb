require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "go9odl2uckgu5ess8ingthi5so1neha0cke7rs"
  end

  get "/" do
    erb :welcome
  end

end