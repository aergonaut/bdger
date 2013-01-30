require 'securerandom'

class Achievement < ActiveRecord::Base
  attr_accessible :badge_id, :body, :user_id, :short_hash

  extend FriendlyId
  friendly_id :long_hash, use: :slugged

  belongs_to :user
  belongs_to :badge

  before_save :generate_hashes

  default_scope order: "achievements.created_at DESC"

  private

    def long_hash
      self.slug ||= SecureRandom.hex(6)
    end

    def generate_hashes
      if self.short_hash.nil? or self.short_hash.empty?
        self.short_hash = SecureRandom.urlsafe_base64(4)
      end
    end
end
