class ItemsController < ApplicationController

  def index
    # Items
    @items = Item.all
    @item = Item.new
    # Tags
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    # Create Item
    @item = Item.new(item_params)
    if @item.save
      # Create Tags
      # Scan user input for individual word characters
      @tags = tag_params['name'].scan(/\w+/)
      @tags.each do |t|
        # Scope tag method same_tag stores the name from tag_params in @same_tag,
        # and performs a query for a tag with that name
        @same_tag = Tag.same_tag(t)
        # If a tag already exists then add it to the item
        if @same_tag.exists?
          @item.tags << @same_tag
        else
          # Create new tags only if there is user input
          unless @tags.empty?
            # Note: t.downcase is for all tag creations
            @tag = Tag.create!(name: t.downcase)
            Tagging.create!(item: @item, tag: @tag)
          end
        end
      end
      # logger.debug "\n\n\nDEBUG START \n"
      # logger.debug @tags
      # logger.debug "\nDEBUG END \n\n\n"
      redirect_to root_path
    else
      redirect_to root_path   # Change to render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    # Before item destroy,
    # find tags having only that association
    @item.tags.each do |t|
      if t.items.count <= 1
        # Destroy Tag
        t.destroy
      end
    end
    # Destroy Item
    @item.destroy
    redirect_to root_path
  end

  def taggings
    render json: Tag.find_by(name: params[:tag])
  end

  def nothing
    render nothing: true
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
