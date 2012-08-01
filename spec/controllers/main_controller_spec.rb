require 'spec_helper'

describe MainController do
  
  render_views

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
    
    #it "returns Main page data" do
     # get 'show'
     #   response.should 
    #end
    
  end

end