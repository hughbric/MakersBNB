require 'sinatra/base'
require_relative 'lib/database_connection_setup'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello world!'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], checkin: params[:checkin], checkout: params[:checkout])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end
end
