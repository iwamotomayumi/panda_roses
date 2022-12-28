class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @new_post_image = PostImage.new
    @post_images = @user.post_images.order("created_at DESC")
  end

  def edit
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を編集しました"
      redirect_to user_path(current_user.id)
    else
     render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user = User.find(current_user[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :introduction, :telephone_number, :is_deleted, :profile_image)
  end


  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to root_path
    end
  end

end
