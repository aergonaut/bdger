require 'spec_helper'

describe BadgesController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should assign all badges" do
      badge = create :badge
      get :index
      expect(assigns(:badges)).to eq([badge])
    end
  end

  describe "GET 'show'" do
    before :each do
      @badge = create :badge
    end

    it "should be successful" do
      get :show, id: @badge
      response.should be_success
    end

    it "should find the right badge" do
      get :show, id: @badge
      assigns(:badge).should == @badge
    end
  end

end
