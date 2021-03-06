require 'sinatra'
Tilt.register Tilt::ERBTemplate, 'html.erb'

class Server < Sinatra::Base
  get '/' do
    all_art = Dir["./art/*.txt"]
    i = rand(all_art.length)
    @data = ""
    File.foreach(all_art[i]) do |line|
      @data += line
    end
    puts all_art[i]
    erb :index, :locals => {:data => @data}
  end
end
