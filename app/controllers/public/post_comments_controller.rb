class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_image_id = @post_image.id
    if @post_comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to post_image_path(@post_image)
    else
      @post_image_detail = PostImage.find(params[:post_image_id])
    unless ViewCount.find_by(user_id: current_user.id, post_image_id: @post_image_detail.id)
      current_user.view_counts.create(post_image_id: @post_image_detail.id)
    end
      render template: "public/post_images/show"
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
