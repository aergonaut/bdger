class Badge < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :big_cartel_link, :description, :image, :name, :tumblr_link
  validates :name, presence: true, uniqueness: true
  friendly_id :name, use: :slugged
end
