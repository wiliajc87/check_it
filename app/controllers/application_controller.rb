class ApplicationController < ActionController::Base
  include ApplicationHelper
  def index
    if current_user
      @item = Item.new
    end
  end
end