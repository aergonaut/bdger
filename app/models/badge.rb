class Badge < ActiveRecord::Base
  attr_accessible :big_cartel_link, :description, :image, :name, :tumblr_link
  validates :name, presence: true
end
