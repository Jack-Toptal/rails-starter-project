source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'

gem 'pg'
gem 'puma', '~> 3.11'
gem 'redis', '~> 4.0'
gem 'bootsnap', '>= 1.6.0', require: false

# Auth
gem 'bcrypt', '~> 3.1.7'
gem 'doorkeeper'

# API
gem 'rack-cors'
gem 'active_model_serializers'
gem 'validates_email_format_of'
gem 'kaminari', '~> 1.2.0'

# Friendly URL
gem 'friendly_id', '~> 5.4.2'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
