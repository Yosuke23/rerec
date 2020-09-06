source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use mysql as the database for Active Record
# Use Puma as the app server
# Use SCSS for stylesheets
# Use Uglifier as compressor for JavaScript assets
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'bcrypt',         '3.1.12'
gem 'faker',          '1.7.3'
gem 'carrierwave',    '1.2.2'
gem 'mini_magick'
gem 'will_paginate',   '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-bgswitcher-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'dotenv-rails'
gem 'fog-core', '2.1.0'
gem 'rails-i18n'
gem 'kaminari'
gem 'addressable'
gem 'actionpack', '5.2.4.3' # 5.2.4.2からupdate 付随して"activestorage"も'5.2.4.3'に自動update
gem 'rack', '>= 2.2.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rails-erd'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
##追加
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end


group :production do
  gem 'mysql2', '>= 0.4.4', '< 0.6.0'
  gem 'fog'
  gem 'rails_12factor'
  gem 'fog-aws', group: :production
end

group :production, :staging do
  gem 'unicorn'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]