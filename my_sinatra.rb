# запросы API

require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace
    get '/' do
      'Hello My Sinatra - Easy and Wide world!'
    end

    get '/hello/:name' do
      "Sinatra приветствует тебя, #{params['name']}!"
    end

    get '/*' do
      "I don't know what is the #{params[:splat]}. It's what you typed."
    end

    namespace '/api/v1' do
      get '/*' do
        "I don't know what is the #{params['splat']}. It's what you typed."
      end
    end

    get '/hello/:name' do
      # соответствует "GET /hello/foo" и "GET /hello/bar",
      # где params['name'] 'foo' или 'bar'
      "Hello #{params['name']}!"
    end

    get '/redirect' do
      redirect to('/hello/World')
    end


  end
end
