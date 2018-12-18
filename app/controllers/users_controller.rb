class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:id])
    # If there is a username in the URL, find the user with that username
    # If you can't a find a user or there are no params (no dynamic stuff in the URL)
    # set @user to be whoever is logged in
    if !@user
      @user = current_user
    end
  end
end
