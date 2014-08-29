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
    @same = Tag.same_tag(tag_params['names'])

    # logger.debug "\n\n\nDEBUG START \n"
    # logger.debug @same
    # logger.debug "\nDEBUG END \n\n\n"

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
