class ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new

    @tags = Tag.all
    @tag = Tag.new

    # Test Query
    @tagging = Tagging.where(tag_id: 33)
  end




  def create
    @item = Item.new(item_params)

    # Test if tag being passed exists
    if Tag.exists?
      # Test if existing tag is assigned
      @item.tags = Tag.find(params[:id])
    else
      @tag = @item.tags.new(tag_params)
    end
    


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

  def tag_params
    params.require(:tag).permit(:name)
  end

end
