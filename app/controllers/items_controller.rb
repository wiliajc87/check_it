class SessionsController < ApplicationController
  def new
  end
  def create
    @item = Item.find_or_create_by(name: params[:name], type: params[:type])
    session[:user_id] = @user.id
    redirect_to root_path
  end
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end