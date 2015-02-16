class ApplicationController < ActionController::Base
  include ApplicationHelper
  def index
    @item = Item.new
  end
end