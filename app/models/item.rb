require "open-uri"

class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  def find_link
    if self.media_type == "movie"
        movie_attr
    elsif self.media_type == "music"
      music_type
    elsif self.media_type == "book"
      book_type
    end
  end
  def movie_attr
    movie_search = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=kukuuwfjqwbz4gns9pguakyn&q=#{self.name}&page_limit=1")
    movie_search = JSON.parse(movie_search)
    self.link = movie_search["movies"][0]["links"]["alternate"]
    self.rotten_score = movie_search["movies"][0]["ratings"]["critics_score"]
    doc = Nokogiri::HTML(open("#{self.link}"))
    if doc.css("#addMe").children.text == "Add to Queue"
      self.on_netflix = true
    else
      self.on_netflix = false
    end

  end

  def music_type
    music_search = HTTParty.get("https://api.spotify.com/v1/search?q=#{self.name}&type=artist&market=US&limit=1")
    self.link = music_search.first[1]["items"][0]["external_urls"]["spotify"]
  end

  def book_type
    book_search = HTTParty.get("https://www.goodreads.com/api/author_url/#{self.name.gsub(" ", "+")}?key=dRQ9mGq2eskZYMhNJ5Yw")
    self.link = book_search.first[1]["author"]["link"]
  end
end
