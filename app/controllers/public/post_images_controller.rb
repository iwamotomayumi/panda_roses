class Public::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to user_path(current_user)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  def edit
  end

 private
  # ストロングパラメータ
  def post_image_params
    params.require(:post_image).permit(:title, :caption, :image)
  end


end

