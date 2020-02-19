source 'http://rubygems.org'

ruby '2.6.1'
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'pg', '~>1.2.2'
gem 'activerecord-postgresql-adapter'

group :development do
  gem 'sqlite3', '~> 1.3.6'
end

# group :production do
#   gem 'pg', '~>1.2.2'
#   gem 'activerecord-postgresql-adapter'
# end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner'
end