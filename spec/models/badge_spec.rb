require 'spec_helper'

describe Badge do
  before do
    @badge = Badge.new name: "French Language", description: "Learn French",
      tumblr_link: "http://lifescouts.com/post/39558983039/lifescouts-french-language-badge-if-you-have",
      big_cartel_link: "http://lifescouts.bigcartel.com/product/lifescouts-french-badge",
      image: "x.png"
  end

  subject { @badge }

  describe "name" do
    describe "cannot be empty" do
      before { @badge.name = "" }
      it { should_not be_valid }
    end

    describe "must be unique" do
      before do
        dup_badge = @badge.dup
        dup_badge.save
      end
      it { should_not be_valid }
    end
  end
end
