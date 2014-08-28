class ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new

    @tags = Tag.all
    @tag = @item.tags.new
  end



  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
  end







  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
