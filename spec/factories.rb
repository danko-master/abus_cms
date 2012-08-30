# Используя символ ':user', мы указываем Factory Girl на необходимость симулировать модель User.
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "UserTest#{n}" }
    sequence(:email) {|n| "email#{n}@example.com" }
    password              "foobar"
    password_confirmation "foobar"
  end

  factory :domain do
    sequence(:name) {|n| "example#{n}.com" }
  end
  
  factory :car do
    sequence(:name) {|n| "example-car#{n}" }
    sequence(:alias) {|n| "example-alias-car#{n}" }
    is_show true
  end
  
  factory :image do
    sequence(:name) {|n| "image#{n}" }
    sequence(:image_file) {|n| "image#{n}.jpg" }
    sequence(:image_thumb_file) {|n| "image#{n}-thumb.jpg" }
    sequence(:car_id) {|n| "#{n}" }
    order_id 1
    data { fixture_file_upload('/files/test-bus-1.jpg', 'image/jpg') }
  end
  
  factory :main do 
    sequence(:title) {|n| "Title example#{n}" }
    content "Content example" 
    metadescription "metadescription example"
    metakeywords "metakeywords example"
    head "head example"
    contact "contact example"
    footer "footer example"
    counter "counter example"
    domain 1
  end
  
  factory :page do 
    name "Name example"
    title "Title example"
    content "Content example" 
    metadescription "metadescription example"
    metakeywords "metakeywords example"
    head "head example"
    ismenu true
    domain 1
  end
  
  
end