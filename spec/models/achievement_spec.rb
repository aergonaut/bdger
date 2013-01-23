require 'spec_helper'

describe Achievement do
  before do
    @achievement = build :achievement
  end

  subject { @achievement }

  it { should respond_to :badge }
  it { should respond_to :user }
  it { should respond_to :slug }
  it { should respond_to :short_hash }

  it { should be_valid }

  describe "hashes are created on save" do
    before { @achievement.save }
    its(:slug) { should_not be_empty }
    its(:short_hash) { should_not be_empty }
  end
end
