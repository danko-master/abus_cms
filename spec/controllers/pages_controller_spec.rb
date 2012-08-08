require 'spec_helper'

describe PagesController do

  describe "for non-signed-in users" do
     
      it "should deny access for index" do
        get :index
        response.should redirect_to(signin_path)
      end
      
  end
  
  
 describe "for signed-in users" do
  
    before(:each) do
      @page = FactoryGirl.create(:page)
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end

      it "GET 'show' should be successful" do
        get :show, :id => @page
        response.should be_success
      end

      it "GET 'new' returns http success" do
        get 'new'
        response.should be_success
      end
      
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  
  end
  
  
  describe "PUT 'update'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @page = FactoryGirl.create(:page)
      test_sign_in(@user)
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :domain => ""}
      end

      it "should render the 'show' page" do
        put :update, :id => @page, :page => @attr
        response.should render_template('show')
      end

    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New Page Update", :title => "New Page Title Update", :content => "New Page Content Update", :domain => 1 }
      end

      it "should change the page's attributes" do
        put :update, :id => @page, :page => @attr
        @page.reload
        @page.name.should == @attr[:name]
        @page.title.should == @attr[:title]
        @page.content.should == @attr[:content]
      end

      it "should redirect to the page show page" do
        put :update, :id => @page, :page => @attr
        response.should redirect_to(page_path(@page))
      end

      it "should have a flash message" do
        put :update, :id => @page, :page => @attr
        flash[:success].should == I18n.t('activerecord.errors.controllers.message.attributes.page.page_update_success')
      end
    end
  end


  
 describe "DELETE 'destroy'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @page = FactoryGirl.create(:page)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @page
        response.should redirect_to(signin_path)
      end
    end

    describe "as a signed in user" do

      before(:each) do
        test_sign_in(@user)
      end

      it "should destroy the page" do
       lambda do
          delete :destroy, :id => @page
        end.should change(Page, :count).by(-1)
      end

      it "should redirect to the pages page" do
        delete :destroy, :id => @page
        response.should redirect_to(pages_path)
      end
      
        
    end
  end
  


end
