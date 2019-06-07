require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/database_connection_setup'

class MakersBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/spaces' if session[:user] != nil
    erb :index
  end

  get '/fake' do
    erb :index_mock
  end

  post '/users' do
    if params[:password] != params[:password_confirmation]
      flash[:nomatch] = "Passwords don't match"
      redirect '/'
    end
    User.create(email: params[:email], password: params[:password])
    session[:user] = User.authenticate(email: params[:email], password: params[:password])
    p session[:user]
    if session[:user].nil?
      flash[:incorrect_details] = "Please fill in the required fields."
      redirect '/'
    else
      redirect '/spaces'
    end
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
    if params[:name].empty?
      flash[:incorrect_details] = "Please fill in the required fields."
      redirect 'spaces/new'
    elsif params[:description].empty?
      flash[:incorrect_details] = "Please fill in the required fields."
      redirect 'spaces/new'
    elsif params[:price].empty? || params[:price] != Integer
      flash[:correct_price] = 'Please enter a number.'
      redirect '/spaces/new'
    elsif params[:checkin].empty?
      flash[:incorrect_details] = "Please fill in the required fields."
      redirect 'spaces/new'
    elsif params[:checkout].empty?
      flash[:incorrect_details] = "Please fill in the required fields."
      redirect 'spaces/new'
    else
      redirect '/spaces'
    end
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

  get '/spaces/bookings/:id' do
    id = params[:id]
    session[:id] = id
    @record = Space.first(:id => id)
    erb :'spaces/bookings'
  end

  post '/spaces/request' do
    space_id = session[:id]
    Booking.create(arrival: params[:request_from], departure: params[:request_until], space_id: space_id)
    if params[:request_from] >= params[:request_until]
      flash[:incorrect_dates] = "Please enter the correct dates."
      redirect "/spaces/bookings/#{space_id}"
    else
      flash[:request_confirmation] = "Booking request has been sent."
      redirect "/spaces/bookings/#{space_id}"
     end   
  end

end
