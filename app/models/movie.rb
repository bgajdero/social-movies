class Movie < ActiveRecord::Base
  attr_accessible :critics_rating, :poster, :synopsis, :title

  def self.ingest_json
  	json = ActiveSupport::JSON.decode(open('http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=' + Network.rt_key).read)
  	json_hash = JSON.parse(json.to_json)
  	unless Movie.find_by_title(json_hash['movies'].first['title'])
  	  json_hash['movies'].each do |movie|
			  @movie = Movie.new
			  @movie.title = movie['title']
			  @movie.synopsis = movie['synopsis']
			  @movie.critics_rating = movie['ratings']['critics_score'].to_i
			  @movie.poster = movie['posters']['detailed']
			  @movie.save
			end
		end
  end
end
