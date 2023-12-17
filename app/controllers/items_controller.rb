class ItemsController < ApplicationController
  def index
    #@items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end
end
