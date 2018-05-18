source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'spreadsheet'
gem 'simple-spreadsheet'


gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'carrierwave'
gem 'whenever', require: false
gem 'json'
gem 'jbuilder'
gem 'stamp'
gem 'responders'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'will_paginate', '~> 3.1.1'
gem 'wicked_pdf'
gem 'sidekiq'

gem 'wkhtmltopdf-binary'
gem 'receipts'
gem 'rails_12factor'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'active_model_serializers', '~> 0.10.0'
gem 'knock'
gem 'jwt'
# gem 'devise_token_auth'
gem 'omniauth'
#gem 'simple_token_authentication', '~> 1.0' # see semver.org
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rake', '~> 12.3.1'
#ruby "2.4.3"
