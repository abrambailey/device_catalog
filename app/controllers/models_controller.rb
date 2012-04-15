class ModelsController < ApplicationController

  def index
    @models = Model.order(:name).where("lower(name) LIKE ?", "%#{params[:term].downcase}%")
    render json: @models.map(&:name)
  end
  
  def selectmodels
  	@brand = Brand.find_or_initialize_by_name(params[:brand_name])
  	@models = Model.where(:brand_id => @brand.id)
  	render json: @models
  end
  
  def new
  	respond_to do |format|
      format.js
    end
  end
end
