require 'spec_helper'

describe User do
  before do
    @user = build :user
  end

  subject { @user }

  it { should respond_to :username }
  it { should respond_to :slug }
  it { should respond_to :achievements }
  it { should respond_to :badges }
  it { should respond_to :website }

  it { should be_valid }

  describe "slug generated on save" do
    before { @user.save }
    its(:slug) { should == @user.username }
  end

  describe "website" do
    describe "can be empty" do
      before { @user.website = "" }
      it { should be_valid }
    end

    describe "must be http or https" do
      before { @user.website = "ftp://some.host" }
      it { should_not be_valid }
    end
  end

end
