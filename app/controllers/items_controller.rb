class ItemsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @items = @user.items
    @movies = @items.where(:media_type => "movie")
    @books = @items.where(:media_type => "book")
    @music = @items.where(:media_type => "music")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(user_id: session[:user_id], name: params[:item][:name], media_type: params[:item][:media_type])
    @item.find_link
    if @item.save
      redirect_to items_path
    else
    end
  end

  def show
    @item = params[:item_id]
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to items_path
  end
end