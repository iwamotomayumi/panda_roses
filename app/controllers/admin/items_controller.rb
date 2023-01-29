class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新規登録しました"
      redirect_to admin_root_path
    else
      @items_desc = Item.order(created_at: :desc).limit(4)
      @items = Item.order(created_at: :desc).page(params[:page]).per(5)
      render template: "admin/homes/top"
    end
  end


  def new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    flash[:notice] = "変更を保存しました"
    redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_root_path
  end


   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
