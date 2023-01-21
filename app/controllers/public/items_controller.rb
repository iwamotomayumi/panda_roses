class Public::ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end


   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
