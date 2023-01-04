class Admin::UsersController < ApplicationController
  def index
     @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "変更を保存しました"
    redirect_to admin_user_path(@user.id)
    else
      flash[:notice] = "変更内容を入力して下さい"
      render :edit
    end
  end


  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :introduction, :telephone_number, :is_deleted, :profile_image)
  end

end
