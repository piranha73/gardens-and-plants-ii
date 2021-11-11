class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    tags = params[:plant_tag][:tag]
    tags.each do |tag|
      @tag = Tag.find(tag)
      @plant_tag = PlantTag.new(plant: @plant, tag: @tag)
      @plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end
end
