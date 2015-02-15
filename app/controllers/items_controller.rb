class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(user_id: session[:user_id], name: params[:item][:name], media_type: params[:item][:media_type])
    @item.find_link
    @item.save
    redirect_to items_path
  end

  def show
    @item = params[:item_id]
  end

  def index
    @items = Item.all
  end
end