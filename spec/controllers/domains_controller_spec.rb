require 'spec_helper'

describe DomainsController do

  render_views
  
  describe "for non-signed-in users" do
     
      it "should deny access for index" do
        get :index
        response.should redirect_to(signin_path)
      end
      
  end
  
  
  
  describe "for signed-in users" do
  
    before(:each) do
      @domain = FactoryGirl.create(:domain)
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end

      it "GET 'show' should be successful" do
        get :show, :id => @domain
        response.should be_success
      end

      it "GET 'new' returns http success" do
        get 'new'
        response.should be_success
      end
  
  end
  
  
  
  describe "PUT 'update'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @domain = FactoryGirl.create(:domain)
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => ""}
      end

      it "should redirect to domains" do
        put :update, :id => @domain, :domain => @attr
        response.should redirect_to(domains_path)
      end

    end

    describe "success" do

      before(:each) do
        @attr = { :name => "blablabla.com" }
      end

      it "should change the page's attributes" do
        put :update, :id => @domain, :domain => @attr
        @domain.reload
        @domain.name.should == @attr[:name]
      end

      it "should redirect to the page show page" do
        put :update, :id => @domain, :domain => @attr
        response.should redirect_to(domain_path(@domain))
      end

      it "should have a flash message" do
        put :update, :id => @domain, :domain => @attr
        flash[:success].should == I18n.t('activerecord.errors.controllers.message.attributes.domain.domain_update_success')
      end
    end
  end
  
  
  
 describe "DELETE 'destroy'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @domain = FactoryGirl.create(:domain)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @domain
        response.should redirect_to(signin_path)
      end
    end

    describe "as a signed in user" do

      before(:each) do
        test_sign_in(@user)
      end

      it "should destroy the domain" do
       lambda do
          delete :destroy, :id => @domain
        end.should change(Domain, :count).by(-1)
      end

      it "should redirect to the pages domain" do
        delete :destroy, :id => @domain
        response.should redirect_to(domains_path)
      end
      
        
    end
  end

end
