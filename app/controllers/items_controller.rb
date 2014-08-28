class ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new

    @tags = Tag.all
    @tag = Tag.new

    # Test Query
    @tagging = Tagging.where(tag_id: 50)
  end




  def create
    @item = Item.new(item_params)
    @same = Tag.same_tag(tag_params["name"])

    # logger.debug '\n\n\n\n\n\HELLO'
    # logger.debug @same

    # If a Tag already exists then add it to the Item,
    # else create a new Tag and add it to the Item

    # Note: test tag_params is empty

    if @same.exists?
      @item.tags << @same
    else
      @item.tags.new(tag_params)
    end

    if @item.save
      redirect_to root_path
    else
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
