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

  it { should be_valid }

  describe "slug generated on save" do
    before { @user.save }
    its(:slug) { should == @user.username }
  end

end
