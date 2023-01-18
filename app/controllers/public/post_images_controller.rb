class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_images = PostImage.published.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @new_post_image = PostImage.new(post_image_params)
    @new_post_image.user_id = current_user.id
    if @new_post_image.save
      flash[:notice] = "新規投稿しました"
      redirect_to user_path(current_user)
    else
      @user = current_user
      @post_images = @user.post_images.order(created_at: :desc)
      @post_images = @user.post_images.published.order(created_at: :desc)
      render template: "public/users/show"
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_image_detail = PostImage.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, post_image_id: @post_image_detail.id)
      current_user.view_counts.create(post_image_id: @post_image_detail.id)
    end
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_image_path(@post_image.id)
    else
      flash[:notice] = "変更内容を入力して下さい"
      render :edit
    end
  end

 private
  # ストロングパラメータ
  def post_image_params
    params.require(:post_image).permit(:title, :caption, :image, :is_published_flag)
  end


end

