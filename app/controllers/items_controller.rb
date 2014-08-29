class ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.new

    @tags = Tag.all
    @tag = Tag.new
  end

  # ADD: case insensitive to tags
  def create
    @item = Item.new(item_params)

    # Scan user input for separate word characters
    @tags = tag_params['name'].scan(/\w+/)

    # logger.debug "\n\n\nDEBUG START \n"
    # logger.debug @tags
    # logger.debug "\nDEBUG END \n\n\n"

    @tags.each do |t|
      # Scope tag method same_tag stores the name from tag_params in @same_tag,
      # and performs a query for a tag with that name
      @same_tag = Tag.same_tag(t)
      # If a Tag already exists then add it to the Item
      if @same_tag.exists?
        @item.tags << @same_tag
      else
        # Create new tags only if there is user input
        unless @tags.empty?
          @tag = Tag.create(name: t)
          Tagging.create(item: @item, tag: @tag)
        end
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
