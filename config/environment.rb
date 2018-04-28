ENV['SINATRA_ENV'] ||= "development"
require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.logger = Logger.new(STDOUT)

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end

require_all 'app'
