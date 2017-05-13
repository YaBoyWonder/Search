require 'youtube_it'

youtube = YouTubeIt::Client.new( :username => "Your Email", :password => "Your Password", :dev_key => "GET THIS FROM SIGNING UP FOR DEV ACCOUNT")

playlist = youtube.add_playlist(:title => "My Plalist" )

file = File.new( "keywords.txt", "r" )
while( keyword = file.gets )
  results = youtube.videos_by( :query => keyword )
  
  if( results.total_result_count > 0 )
    youtube.add_video_to_playlist( playlist.playlist_id, results.videos[0].video_id )
  else
    puts "Failed to find anything for " + keyword
  end
end
