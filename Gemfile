source 'https://rubygems.org'

gem 'rails', '3.1.3'
gem 'pg', '0.12.2' # БД
gem 'therubyracer', '0.9.9' # для вызова javascript
gem 'jquery-rails', '1.0.19'



# Для upload и ckeditor
gem 'paperclip', '3.1.2'
gem 'ckeditor', '3.6.3'


# Для ресайза
#gem 'mini_magick', '~> 3.4'

# Локализация javascript
gem "i18n-js", "~> 2.1.2"


# Gems used only for assets and not required
# in production environments by default.
# файлопровод
group :assets do
  gem 'sass-rails',   '3.1.5' # создает css.scss файл
  gem 'coffee-rails', '3.1.1' # создает js.coffee файл
  gem 'uglifier', '>= 1.0.3' # оболочка для UglifyJS JavaScript
end



group :development do
  gem 'rspec-rails', '2.9.0' # RSpec тесты
  gem 'annotate', '2.4.0' # Описание для модели
end

group :test do
  gem 'rspec-rails', '2.9.0'  
  gem 'factory_girl_rails', '3.5.0' # Фабрика юзеров для тестирования
  #gem "capybara", "~> 1.1.2"
  gem 'webrat', '0.7.3' # Интеграционное тестирование (прокликать формы и вернуть нужный результат)
end