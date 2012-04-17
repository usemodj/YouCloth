class Wash < ActiveRecord::Base
  has_many :cloths,	:dependent => :destroy
  belongs_to :customer
end
