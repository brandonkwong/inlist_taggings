class TagsController < ApplicationController

  # def create
  #   @tag = Tag.new(tag_params)
  #   if @tag.save
  #     redirect_to root_path
  #   end
  # end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
