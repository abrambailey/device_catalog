class Submodel < ActiveRecord::Base
  attr_accessible :model_id, :name
  has_many :styles
  belongs_to :model
  
  before_save :format_string
  
  private

		def format_string
		  self.name = self.name.lstrip.rstrip
		end
		
end
