class Style < ActiveRecord::Base
  attr_accessible :name, :submodel_id, :model_id, :brand_id, :submodel_name, :model_name, :brand_name
  belongs_to :submodel
  belongs_to :model
  belongs_to :style
  belongs_to :brand
  
  def submodel_name
  	submodel.try(:name)
	end
	
  def submodel_name=(name)
    self.submodel = Submodel.find_or_initialize_by_name(name) if name.present?
  end

  def model_name
  	model.try(:name)
	end
	
  def model_name=(name)
    self.model = Model.find_or_initialize_by_name(name) if name.present?
  end

  def brand_name
  	brand.try(:name)
	end
	
  def brand_name=(name)
    self.brand = Brand.find_or_initialize_by_name(name) if name.present?
  end
  
  before_save :format_string
  
  private

		def format_string
		  self.name = self.name.lstrip.rstrip
		end
end
