# This file is used by Rack-based servers to start the application.

# require_relative "config/environment"
#
# run Rails.application
# Rails.application.load_server

require './my_sinatra'
run Sinatra::Application

root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'my_sinatra.rb' )

app = Rack::Builder.app do
  run MyAppModule::App
end

run app
