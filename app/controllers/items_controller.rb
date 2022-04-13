class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @pagy, @items = pagy(current_user.items.order(id: :desc))
      flash.now[:danger] = '投稿に失敗しました。'
      render 'items/new'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def item_params
    params.require(:item).permit(:menu, :category, :comment, :image)
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
end