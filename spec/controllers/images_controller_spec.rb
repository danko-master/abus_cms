require 'spec_helper'

describe ImagesController do


  describe "for non-signed-in users" do     
      it "should deny access for index" do
        get :index
        response.should redirect_to(signin_path)
      end
  end

  describe "for signed-in users" do  
    before :each do
      @domain = FactoryGirl.create(:domain)
      @user = FactoryGirl.create(:user)
      @car = FactoryGirl.create(:car)
      @image = FactoryGirl.create(:image)
      @attr = {:name => "image-1", :image_file => "image-1.png", :image_thumb_file => "image-1-thumb.png", :car_id => 1, :order_id => 0}

      test_sign_in(@user)
    end
  
    it "GET 'index' returns http success" do
        get :index, :car_id => @car.id
        response.should be_success
    end
    
    it "attempt to load an image" do
        post :upload_image, :upload => { :datafile => @image.data }, :car_id => @car.id
        response.should redirect_to images_path(:car_id => @car.id)
    end
    
    
   #it "should delete an image using Ajax" do
   #  lambda do
   #    xhr :delete, :destroy, :id => @image.id        
   #    response.should be_success
   #  end.should change(Image, :count).by(-1)  
   #end
 
  #it "should destroy image" do
  #   xhr :delete, :destroy, :id => @image.id, :format => "html"
  #   flash[:notice].should == I18n.t('activerecord.errors.controllers.message.attributes.image.image_destroy_success')
  #end
  end
  
end
