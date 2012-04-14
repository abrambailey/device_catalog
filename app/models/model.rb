class Model < ActiveRecord::Base
  attr_accessible :brand_id, :name
	belongs_to :brand
  has_many :styles
end
