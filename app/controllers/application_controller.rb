class ApplicationController < ActionController::Base
  include ApplicationHelper
  def index
    # if session[:user_id] == nil
    #   redirect_to new_session_path
    # else
    #   @user = current_user
    # end
  end
end