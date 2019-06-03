require 'sinatra/base'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello world!'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end 

  post '/spaces/new' do
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces/index'
  end

end
