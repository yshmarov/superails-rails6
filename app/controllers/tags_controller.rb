# frozen_string_literal: true

class TagsController < ApplicationController
  def create
    tag = Tag.new(tag_params)
    return unless tag.valid?

    tag.save
    render json: tag
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
