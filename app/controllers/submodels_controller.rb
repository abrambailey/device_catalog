class SubmodelsController < ApplicationController

  def index
    @submodels = Submodel.order(:name).where("lower(name) LIKE ?", "%#{params[:term].downcase}%")
    render json: @submodels.map(&:name)
  end

  def selectsubmodels
  	@brand = Brand.find_by_name(params[:brand_name])
  	@model = Model.find_or_initialize_by_name(params[:model_name])
  	if @model.brand_id == @brand.id 
		else 
			@model = Model.new
			@model.name = params[:model_name]
			@model.brand_id = @brand.id
			@model.save
		end
  	@submodels = Submodel.where(:model_id => @model.id)
  	render json: @submodels
  end
  
  def new
  	respond_to do |format|
      format.js
    end
  end
  
  def savesubmodel
  	@brand = Brand.find_by_name(params[:brand_name])
  	@model = Model.find_by_name(params[:model_name])
  	@submodel = Submodel.find_or_initialize_by_name(params[:submodel_name])
  	if @submodel.model_id == @model.id
  	else
  	@submodel = Submodel.new
  	@submodel.name = params[:submodel_name] 
  	@submodel.brand_id = @brand.id
  	@submodel.model_id = @model.id
  	@submodel.save
  	end
  	render :nothing => true
  end
end
