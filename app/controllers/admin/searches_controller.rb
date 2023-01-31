class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]

    if @range == "会員"
      @users = User.looks(params[:search], params[:word])
    else
      @post_images = PostImage.order(created_at: :desc).looks(params[:search], params[:word])
    end
  end

end
