class Public::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end


end
