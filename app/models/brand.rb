class Brand < ActiveRecord::Base
  attr_accessible :name
  has_many :models
end
