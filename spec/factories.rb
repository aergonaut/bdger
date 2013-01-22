FactoryGirl.define do
  factory :badge do
    name "Niagra Falls"
    big_cartel_link "http://lifescouts.bigcartel.com/product/lifescouts-niagra-falls"
    tumblr_link "http://lifescouts.com/post/40755585786/lifescouts-niagara-falls-badge-if-you-have-this"
  end

  factory :user do
    username "aergonaut"
    provider "twitter"
    uid "12345"
  end
end