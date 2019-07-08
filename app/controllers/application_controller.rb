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

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

  end

end