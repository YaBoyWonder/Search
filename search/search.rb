require 'youtube_it'
youtube = YouTubeIt::Client.new( :username => "email", :password => "pass", :dev_key => )

playlist = youtube.add_playlist(:title => "My Playlist" )

file = File.new( "keywords.txt", "r" )
while( keyword = file.gets )
  results = youtube.videos_by( :query => keyword )
  
  if( results.total_result_count > 0 )
    youtube.add_video_to_playlist( playlist.playlist_id, results.videos[0].video_id )
  else
    puts "Error, Failed to find anything for " + keyword
  end
end
 
