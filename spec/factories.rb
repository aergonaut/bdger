FactoryGirl.define do
  factory :badge do
    sequence(:name) { |n| "badge_#{n}" }
    big_cartel_link "http://lifescouts.bigcartel.com/product/lifescouts-niagra-falls"
    tumblr_link "http://lifescouts.com/post/40755585786/lifescouts-niagara-falls-badge-if-you-have-this"
  end

  factory :user do
    sequence(:username) { |n| "user_#{n}"}
    provider "twitter"
    uid "12345"
  end

  factory :achievement do
    badge
    user
  end
end
