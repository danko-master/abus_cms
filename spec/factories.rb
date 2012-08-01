# Используя символ ':user', мы указываем Factory Girl на необходимость симулировать модель User.
Factory.define :user do |user|
  user.sequence(:name) { |n| "UserTest#{n}" }
  user.sequence(:email) {|n| "email#{n}@example.com" }
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :domain do |domain|
  domain.sequence(:name) {|n| "example#{n}.com" }
end