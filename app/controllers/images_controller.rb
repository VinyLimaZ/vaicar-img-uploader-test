# frozen_string_literal: true

class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find_by(slug: params[:slug])
  end

  private

  def image_params
    params.require(:image).permit(:owner, :description, :file)
  end
end
