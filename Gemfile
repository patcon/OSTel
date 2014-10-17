source 'http://rubygems.org'

gem 'rails', '3.0.20'

group :development do
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails-collection'
  gem 'sqlite3', :require => 'sqlite3'
end

group :staging, :production do
  gem 'pg'
  gem 'unicorn'
end

gem 'devise'
gem 'rake', '>= 0.8.7'
