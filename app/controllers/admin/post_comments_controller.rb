class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
