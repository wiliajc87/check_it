class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(user_id: session[:user_id], name: params[:item][:name], media_type: params[:item][:media_type])
    if @item.media_type == "movie"
      movie_type
    elsif @item.media_type == "music"
      music_type
    elsif @item.media_type == "book"
      book_type
    end
    @item.save
    redirect_to items_path
  end

  def show
    @item = params[:item_id]
  end

  def index
    @items = Item.all
  end

  def movie_type
    movie_search = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=kukuuwfjqwbz4gns9pguakyn&q=#{@item.name}&page_limit=1")
    movie_search = JSON.parse(movie_search)
    @item.link = movie_search["movies"][0]["links"]["alternate"]
  end

  def music_type
    music_search = HTTParty.get("https://api.spotify.com/v1/search?q=#{@item.name}&type=artist&market=US&limit=1")
    @item.link = music_search.first[1]["items"][0]["external_urls"]["spotify"]
  end

  def book_type
    book_search = HTTParty.get("https://www.goodreads.com/api/author_url/#{@item.name.gsub(" ", "+")}?key=dRQ9mGq2eskZYMhNJ5Yw")
    @item.link = book_search.first[1]["author"]["link"]
  end
end