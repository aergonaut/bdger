require 'spec_helper'

describe Badge do
  before do
    @badge = FactoryGirl.build :badge
  end

  subject { @badge }

  it { should respond_to :name }
  it { should respond_to :big_cartel_link }
  it { should respond_to :tumblr_link }

  it { should be_valid }

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
