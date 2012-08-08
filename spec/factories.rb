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