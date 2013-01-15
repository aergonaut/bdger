require 'spec_helper'

describe User do
  before do
    @user = User.new email: "aergonaut@gmail.com", password: "swordfish", password_confirmation: "swordfish"
  end

  subject { @user }

  it { should be_valid }

  describe "email" do
    describe "when email is empty" do
      before { @user.email = "" }
      it { should_not be_valid }
    end

    describe "when email is not unique" do
      before do
        dupe = @user.dup
        dupe.save
      end
      it { should_not be_valid }
    end

    describe "email is case insensitive" do
      let(:uppercase_email) { "UpperCase@Email.com" }
      before do
        @user.email = uppercase_email
        @user.save
      end
      its(:email) { should == uppercase_email.downcase }
    end
  end

  describe "password" do
    describe "when password is too short" do
      before { @user.password = "1234567" }
      it { should_not be_valid }
    end

    describe "when password confirmation does not match" do
      before { @user.password_confirmation = "wrong" }
      it { should_not be_valid }
    end
  end


end
