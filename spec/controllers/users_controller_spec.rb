require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    before :each do
      @user = FactoryGirl.create :user
    end

    it "should be successful" do
      get :show, username: @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, username: @user
      assigns(:user).should == @user
    end
  end

end
