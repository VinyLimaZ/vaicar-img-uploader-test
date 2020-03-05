# frozen_string_literal: true

class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
  end

  def show
    @image = Image.find_by(slug: params[:slug])
  end

  private

  def image_params
    params.require(:image).permit(:owner, :description, :file)
  end
end
