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
    if @user.id == current_user.id
      @user = current_user
      @pending_approvals = Approval.where user_two_id: current_user.id, approval: false
      # raise
    end
  end

  def connect
    @approval = Approval.new
    @approval.user_one_id = current_user.id
    @approval.user_two_id = User.find_by(username: params[:username]).id
    @approval.approval = false
    @approval.save
    redirect_to users_path
  end

  # def create
  #   # opt 1
  #   approval = Approval.create(approval_params)
  #   # opt 2
  #   approval = Approval.new
  #   approval.create = approval[params]
  #   redirect_to current_user_path
  # end

  def confirm
    approval = Approval.find_by(id: params[:id])
    approval.approval = true
    approval.save
    redirect_to users_path
  end

  private

  def approval_params
    params.require(:approval).permit(:user_one_id, :user_two_id, :approval)
  end
end
