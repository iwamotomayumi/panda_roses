class Admin::ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新規登録しました"
      redirect_to admin_root_path
    else
      flash[:notice] = "必要事項を入力して下さい"
      render :top
    end
  end


  def new
  end

  def show
  end

  def edit
  end


   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
