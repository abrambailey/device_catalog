class SubmodelsController < ApplicationController

  def index
    @submodels = Submodel.order(:name).where("lower(name) LIKE ?", "%#{params[:term].downcase}%")
    render json: @submodels.map(&:name)
  end

  def selectsubmodels
  	@brand = Brand.find_or_initialize_by_name(params[:brand_name])
  	@model = Model.find_or_initialize_by_name(params[:model_name])
  	if @model.brand_id == @brand.id 
  	@submodels = Submodel.where(:model_id => @model.id)
  	render json: @submodels
  	else
  	render json: []
  	end
  end
  
  def new
  	respond_to do |format|
      format.js
    end
  end
  
  def submodeltest
  	@model = Model.find_or_initialize_by_name(params[:model_name])
  	@brand = Brand.find_or_initialize_by_name(params[:brand_name])
  	@submodel = Submodel.where(:name => params[:submodel_name], :model_id => @model.id, :brand_id => @brand.id)
  	if @submodel.empty?
  		render json: []
		else
			render json: @submodel
  	end
  end
  
  def savesubmodel
  	@brand = Brand.find_or_initialize_by_name(params[:brand_name])
  	@model = Model.find_or_initialize_by_name(params[:model_name])
  	@submodel = Submodel.new
  	@submodel.name = params[:submodel_name] 
  	@submodelcheck = Submodel.where(:name => @submodel.name, :brand_id => @brand.id, :model_id => @model.id)
		if @submodelcheck.empty?
  	@submodel.brand_id = @brand.id
  	@submodel.model_id = @model.id
  	@submodel.save
  	end
  	render :nothing => true
  end
end
