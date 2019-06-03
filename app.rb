require 'sinatra/base'

class MakersBNB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello world!'
  end
end
