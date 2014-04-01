require 'sinatra/base'
class App < Sinatra::Application

  ORIGINAL_URL = []

  get '/' do
    erb :index
  end

  post '/' do
    ORIGINAL_URL << params[:input_url]
    ORIGINAL_URL
    redirect "/#{ORIGINAL_URL.length}"
  end

  get '/:id' do
    erb :result, locals: {:url => ORIGINAL_URL[params[:id].to_i-1], :new_url => params[:id].to_i}

    #params = {
    #  :id => "#{ORIGINAL_URL.length.to_s}",
    #  :result => "foo"
    #}


    #erb :result, :locals => {:url => ORIGINAL_URL.first, :new_url => "foo"}


  end

end

