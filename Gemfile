source 'https://rubygems.org'

ruby '4.0.9'

gem 'rails', '~> 8.1.4'
gem 'propshaft' # アセットパイプライン
gem 'importmap-rails' # JavaScript を importmap で読み込む
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'bootsnap', require: false
gem 'puma', '>= 5.0'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'rails-i18n'
gem 'carrierwave'
gem 'cloudinary'
gem 'simple_form'
gem 'dotenv-rails'

group :development, :test do
  gem 'sqlite3', '>= 2.1' # Use sqlite3 as the database for Active Record
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console'
  gem 'bullet'
end

group :test do
  gem 'rails-controller-testing' # assigns, render_template
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
end
