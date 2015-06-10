require 'sinatra'
require 'sinatra/reloader'
# require_relative

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end
end
