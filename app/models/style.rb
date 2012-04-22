class Style < ActiveRecord::Base
 attr_accessible :dimage, :name, :submodel_id, :model_id, :brand_id, :submodel_name, :model_name, :brand_name, :generic, :battery, :programs, :channels, :options
  belongs_to :submodel
  belongs_to :model
  belongs_to :style
  belongs_to :brand

	has_attached_file :dimage, :styles => { :medium => "260x260>", :thumb => "100x100>" }
	
  validates_presence_of :name
  validates_presence_of :brand_name
  validates_presence_of :model_name
  validates_presence_of :submodel_name
  validates_presence_of :generic, :message => ""
  validates_presence_of :battery, :message => ""
  validates_presence_of :programs
  validates_presence_of :channels
  validates :dimage, :attachment_presence => true
  validates_attachment_content_type :dimage, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
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
