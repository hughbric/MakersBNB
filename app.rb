require 'sinatra/base'
require_relative './lib/user'
require_relative 'lib/database_connection_setup'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    User.create(email: params[:email], password: [:password])
    redirect '/spaces'
  end

  get '/spaces' do
    "Book a Space"
  end
end
