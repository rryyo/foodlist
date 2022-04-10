class ToppagesController < ApplicationController
  def index
    if logged_in?
      @item = current_user.items.build
      @pagy, @items = pagy(Item.all.order(id: :desc))
    end
  end
end