require 'spec_helper'

describe DomainsController do

  render_views
  
    
  describe "GET 'show'" do

    before(:each) do
      @domain = Factory(:domain)
    end

    it "should be successful" do
      get :show, :id => @domain
      response.should be_success
    end

  end  
  

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
  
  

end
