source 'https://rubygems.org'

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'rack-cors', require: 'rack/cors'
gem 'mysql2'
gem 'activerecord-import', '~> 0.11.0'
gem 'active_model_serializers', '~> 0.10.0'
gem 'kaminari'
gem 'has_scope'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
  gem "codeclimate-test-reporter", require: nil
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
