require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/database_connection_setup'

class MakersBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

#  USER ADMIN
#  Signup, login, logout
  get '/' do
    redirect '/spaces' if session[:user] != nil
    erb :index
  end

  post '/users' do
    if params[:password] != params[:password_confirmation]
      flash[:nomatch] = "Passwords don't match"
      redirect '/'
    end
    User.create(email: params[:email], password: params[:password])
    session[:user] = User.authenticate(email: params[:email], password: params[:password])
    redirect '/spaces'
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions/new' do
    session[:user] = User.authenticate(email: params[:email], password: params[:password])
    if session[:user].nil?
      flash[:nomatch] = "Your username or password is incorrect"
      redirect '/sessions/new'
    end
    redirect '/spaces'
  end

  get '/sessions/logout' do
    session[:user] = nil
    redirect '/sessions/new'
  end

#  SPACE VIEWS AND LISTING
  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    user = session[:user]
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      checkin: params[:checkin],
      checkout: params[:checkout],
      user_id: user.id
    )
    redirect '/spaces'
  end

  get '/spaces/bookings/:id' do
    session[:space_id] = params[:id]
    @space = Space.first(:id => session[:space_id])
    erb :'spaces/bookings'
  end

  get '/spaces/confirm_request/:id' do
    session[:booking_id] = params[:id]
    @booking = Booking.first(:id => session[:booking_id])

    erb :'spaces/confirm_request'
  end

# BOOKING MANAGEMENT
  post '/bookings/confirmation' do
    session[:booking_id]
    booking = Booking.first(:id => session[:booking_id])
    if params[:decision] == "confirm"
      booking.update(:confirmed => true)
    elsif params[:decision] == "deny"
      booking.update(:confirmed => false)
    end
    redirect '/bookings/requests'
  end

  post '/spaces/request' do
    space_id = session[:space_id]
    user = session[:user]
    # flash messsage 'Request to book has been sent'
    booking = Booking.create(
      arrival: params[:request_from],
      departure: params[:request_until],
      space_id: space_id,
      user_id: user.id
    )
    redirect '/spaces'
  end

  get '/bookings/requests' do
    user = session[:user]
    @bookings_made = Booking.all(:user_id => user.id)
    @bookings_received = Booking.all({Booking.space.user.id => user.id})
    erb :'bookings/requests'
  end
end
