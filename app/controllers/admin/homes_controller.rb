class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def top
   @item = Item.new
    #=> :asc,古い順 :desc,新しい順
   @items_desc = Item.all
   @items = Item.page(params[:page]).per(10)
  end



   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
