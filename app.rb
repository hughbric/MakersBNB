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
    p 123
  end

  get '/spaces' do
    p 456
    erb :'spaces/index'
  end

end
