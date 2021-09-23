# frozen_string_literal: true

class TagsController < ApplicationController
  def create
    tag = Tag.new(tag_params)
    if tag.valid? # rubocop:todo Style/GuardClause
      tag.save
      render json: tag
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
