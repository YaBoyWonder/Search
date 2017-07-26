require 'viddl-rb'
require 'open-uri'

url = ViddlRb.get_urls('https://www.youtube.com/watch?v=zs7xO5P3Az4').first

open('my_video.avi', 'wb') do |file| #kill necon
  file << open(url).read
end

puts Dir['./*.avi'] #=> ./my_video.avi
