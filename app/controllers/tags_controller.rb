class TagsController < ApplicationController

  respond_to :json

  def index
    @tags = Tag.all
    respond_with @tags, each_serializer: TagSerializer
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to root_path
  end

end
