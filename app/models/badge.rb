class Badge < ActiveRecord::Base
  attr_accessible :big_cartel_link, :description, :image, :name, :tumblr_link
  
  validates :name, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :achievements
  has_many :users, through: :achievements

  def image_url
    "//#{ENV["FOG_DIRECTORY"]}.s3.amazonaws.com/badges/#{self.image}"
  end
end
