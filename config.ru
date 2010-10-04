require 'rubygems'
require 'sinatra'
require 'static'

### Embeds files using base64. Serves normally to old browsers.  

require 'rack/embed'
use Rack::Embed, :max_size => 4096

###############################################################

run Sinatra::Application