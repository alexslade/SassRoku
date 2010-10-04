require 'rubygems'
require 'sinatra'
require 'static.rb'

require 'rack/embed'
use Rack::Embed, :max_size => 5000


run Sinatra::Application