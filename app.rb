require 'sinatra/base'
class App < Sinatra::Application

  ORIGINAL_URL = []

  get '/' do
    erb :index
  end

  post '/' do
    orig_url = params[:input_url]
    ORIGINAL_URL << {orig_url => "staging-url-shortener.herokuapp.com/#{ORIGINAL_URL.length+1}"}
    redirect "/#{ORIGINAL_URL.length.to_s}"
  end

  get '/:id' do
    erb :result, locals: {:url => ORIGINAL_URL[(params[:id].to_i)-1].keys[0], :new_url => "staging-url-shortener.herokuapp.com/#{params[:id].to_i-1}"}

  end

end

