source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'pry'
gem 'active_model_serializers'
gem 'sidekiq'
gem "sidekiq-scheduler"
gem 'rack-cors', require: 'rack/cors'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"


gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Run against this stable release
group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"
end

