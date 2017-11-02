require 'sinatra'
require 'sinatra/reloader' if development?

def encrypt(word,shift)
  encrypted = word.split("").collect do |x| 
    if x.match(/\w/)
      val = x.ord + shift 
      val = val.chr
    else
      val = x
    end
  end
  encrypted = encrypted.inject{|x,y| x+y}
  return encrypted
end


get '/' do 
  word = params["word"]
  shift = params["shift"].to_i

  encrypted = encrypt(word,shift) if word

  erb :index, :locals => {:encrypted => encrypted}
end