class Customer < ActiveRecord::Base
  belongs_to :user,	:dependent => :destroy
  has_many :washes
end
