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

    # Scope tag method same_tag stores the name from tag_params in @tag,
    # and performs a query for a tag with that name
    @tag = Tag.same_tag(tag_params['name'])

    # logger.debug "\n\n\nDEBUG START \n"
    # logger.debug @tag.name
    # logger.debug "\nDEBUG END \n\n\n"

    # If a Tag already exists then add it to the Item,
    # else create a new Tag and add it to the Item
    if @tag.exists?
      @item.tags << @tag
    else
      unless tag_params['name'].empty?
        @item.tags.new(tag_params)
      end
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
