require 'spec_helper'

describe MainController do
  
  render_views

 describe "for non-signed-in users" do
     
      it "should deny access show main" do
        get :show
        response.should redirect_to(signin_path)
      end
  end
  
  
  
  describe "for signed-in users" do
  
    before(:each) do
      @main = FactoryGirl.create(:main)
      @page = FactoryGirl.create(:page)
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      session[:current_domain_id] = 1
      session[:current_domain_name] = "first-example.com"
    end

      it "GET 'show' should be successful" do
        get 'show'
        response.should be_success
      end
  
  end

end