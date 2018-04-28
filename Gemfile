source 'http://rubygems.org'
ruby '2.3.3'
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'sinatra-flash'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pony'
gem 'bcrypt'
gem "tux"

group :production do
  gem 'pg', '0.15'
end

group :development do 
	gem 'sqlite3'
	gem 'pry'
end


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
