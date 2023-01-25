class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    post_images = PostImage.published.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @post_images = Kaminari.paginate_array(post_images).page(params[:page]).per(10)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_post_images_path
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to admin_post_image_path(@post_image.id)
    else
     render :edit
    end
  end

 private
  # ストロングパラメータ
  def post_image_params
    params.require(:post_image).permit(:title, :caption, :image)
  end

end
