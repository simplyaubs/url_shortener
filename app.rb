require 'sinatra/base'
class App < Sinatra::Application

  ORIGINAL_URL = []
  SHORT_URL = []

  get '/' do
    erb :index
  end

  post '/' do
    ORIGINAL_URL << params[:input_url]
    ORIGINAL_URL.each_with_index do |url, index|
      SHORT_URL << "http://staging-url-shortener.herokuapp.com/#{index + 1}"
    end
    redirect '/result'
  end

  get '/result' do
    erb :result, :locals => {:url => ORIGINAL_URL.first, :new_url => SHORT_URL.first}

  end

end

