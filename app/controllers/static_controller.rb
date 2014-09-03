class StaticController < ApplicationController
  
  def index
    # Items
    @items = Item.all
    @item = Item.new
    # Tags
    @tags = Tag.all
    @tag = Tag.new
  end
  
end
