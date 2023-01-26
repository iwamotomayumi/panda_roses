class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
   @item = Item.new
    #=> :asc,古い順 :desc,新しい順
   @items = Item.order(created_at: :desc).page(params[:page]).per(8)
  end



   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
