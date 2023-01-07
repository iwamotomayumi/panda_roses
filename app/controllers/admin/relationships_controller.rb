class Admin::RelationshipsController < ApplicationController
  before_action :authenticate_admin!

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @user = User.find(params[:user_id])
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @user = User.find(params[:user_id])
  end
end
