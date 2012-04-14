class BrandsController < ApplicationController

  def index
    @brands = Brand.order(:name).where("lower(name) LIKE ?", "%#{params[:term].downcase}%")
    render json: @brands.map(&:name)
  end
  
  def new
  	respond_to do |format|
      format.js
    end
  end
  
end
