require 'sinatra/base'
require_relative 'lib/database_connection_setup'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/spaces' if session[:user] != nil
    erb :index
  end

  post '/users' do
    redirect '/' if params[:password] != params[:password_confirmation]
    User.create(email: params[:email], password: params[:password])
    redirect '/spaces'
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

  get '/sessions/new' do
    erb :login
  end

  post '/sessions/new' do
    session[:user] = User.authenticate(email: params[:email], password: params[:password])
    redirect '/sessions/new' if session[:user].nil?

    redirect '/spaces'
  end

  get '/sessions/logout' do
    session[:user] = nil
    redirect '/sessions/new'
  end
end
