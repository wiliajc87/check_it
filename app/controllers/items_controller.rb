class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(name: params[:item][:name], media_type: params[:item][:media_type])
    redirect_to root_path
  end

  def show
    @item = params[:item_id]
  end
end


    # if params[:item][:type] == 'music'
    #   @item.type = 'music'
    # elsif params[:item][:type] == 'movie'
    #   @item.type = 'movie'
    # else
    #   @item.type = "book"
    # end
    # @item.save
