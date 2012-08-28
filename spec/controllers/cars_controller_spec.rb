require 'spec_helper'

describe CarsController do

  render_views
  
  describe "for non-signed-in users" do     
      it "should deny access for index" do
        get :index
        response.should redirect_to(signin_path)
      end
      
      it "should deny access for new" do
        get :new
        response.should redirect_to(signin_path)
      end
  end
  
  
  describe "for signed-in users" do
    before(:each) do
      @domain = FactoryGirl.create(:domain)
      @user = FactoryGirl.create(:user)
      @car = FactoryGirl.create(:car)
      @attr = { :name => "test-car", :alias => "test-car", :is_show => true}
      @attr_empty = { :name => "", :alias => nil, :is_show => nil}

      test_sign_in(@user)
    end
    
    it "GET 'index' returns http success" do
        get :index
        response.should be_success
    end
    
    it "GET 'show' should be successful" do
        get :show, :id => @car
        response.should be_success
    end
    
    it "GET 'new' returns http success" do
        get 'new'
        response.should be_success
    end
   
    it "failure update and should redirect to cars" do
        put :update, :id => @car, :name => @attr_empty[:name]
        response.should redirect_to(@car)
    end
    
    it "successfully updated and should change the car's attributes" do
        put :update, :id => @car, :car => @attr
        @car.reload
        @car.name.should == @attr[:name]
        @car.alias.should == @attr[:alias]
        @car.is_show.should == @attr[:is_show]
    end
    
    it "successfully updated and should redirect to the car show page" do
        put :update, :id => @car, :car => @attr
        response.should redirect_to(@car)
    end
    
    it "successfully updated and should have a flash message" do
        put :update, :id => @car, :car => @attr
        flash[:success].should == I18n.t('activerecord.errors.controllers.message.attributes.car.car_update_success')
    end
    
    it "should destroy the car" do
       lambda do
          delete :destroy, :id => @car
        end.should change(Car, :count).by(-1)
    end

    it "successfully destroyed and should redirect to the cars" do
        delete :destroy, :id => @car
        response.should redirect_to(cars_path)
    end
    
    it "successfully destroyed and should show flash message" do
        delete :destroy, :id => @car
        flash[:success].should == I18n.t('activerecord.errors.controllers.message.attributes.car.car_destroy_success')
    end
      
  end
end
