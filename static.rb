require 'rubygems'
require 'sinatra'
require 'haml'

gem 'sinatra-static-assets'
require 'sinatra/static_assets'

before do
  cache_control :public, :max_age => 86400
end



get '*/' do |path|
  haml :"pages#{path}/index"
end 

get '/*.*' do |path, ext| 
  
  # Perform actions based on the extension
  case ext
    when 'html' 
      haml :"pages/#{path}"
    when 'css'  
      content_type 'text/css'
      sass :"#{path}"
  end
  
end

# Show error pages in production mode
configure :production do
  not_found do
    haml :'errors/404'
  end

  error do
    haml :'errors/500'
  end
end