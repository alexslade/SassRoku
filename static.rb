require 'rubygems'
require 'sinatra'
require 'haml'

gem 'sinatra-static-assets'
require 'sinatra/static_assets'

get '/' do
  haml :'pages/index'
end

get '/*.*' do |path, ext| 
  case ext
    when 'html'
      haml :"pages/#{path}"
    when 'css'
      content_type 'text/css'
      sass :"#{path}"
  end
end

configure :production do
  not_found do
    haml :'errors/404'
  end

  error do
    haml :'errors/500'
  end
end