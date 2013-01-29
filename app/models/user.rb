# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :remember_me, :username, :website, :email
  # attr_accessible :title, :body

  # uri pattern thanks to http://daringfireball.net/2010/07/improved_regex_for_matching_urls
  UriPattern = /\A((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/?)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s\`!()\[\]{};:\'\".,<>?«»“”‘’]))/i
  validates :website, format: UriPattern, allow_nil: true, allow_blank: true
  validates :email, uniqueness: true

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :achievements
  has_many :badges, through: :achievements

  before_save :downcase_email

  def self.from_omniauth(auth)
    # raise auth.to_yaml
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      # user.avatar = auth.extra.raw_info.profile_image_url_https
    end
  end

  protected

    def downcase_email
      self.email.downcase!
    end
end
