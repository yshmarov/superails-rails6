class TagsController < ApplicationController

  def create
    tag = Tag.new(tag_params)
    if tag.valid?
      tag.save
      render json: tag
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
