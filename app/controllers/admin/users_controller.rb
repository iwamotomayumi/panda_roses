class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
     @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "会員情報を編集しました"
    redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :introduction, :telephone_number, :is_deleted, :profile_image)
  end


end
