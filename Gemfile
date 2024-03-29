source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.6"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
gem 'active_storage_validations'

# Authentication & authorization
gem "devise", "~> 4.8"
gem "omniauth", "~> 2.1"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth-github", "~> 2.0"
gem "omniauth-vkontakte", "~> 1.8"

gem "pundit", "~> 2.2"
gem "geocoder", "~> 1.8"

gem "aasm", "~> 5.4"
#gem "after_commit_everywhere", "~> 1.3"


gem "searchkick", "~> 5.1"
gem "elasticsearch", "~> 7.17.7"

gem "elasticsearch-rails", "~> 7.2"
gem "elasticsearch-model", "~> 7.2"

# speed up work with JSON
gem "oj", "~> 3.14"

# get your Rails variables in your js
#gem "gon", "~> 6.4"

gem 'carrierwave', '>= 3.0.0', '< 4.0'
# gem "rmagick", "~> 5.2"
# gem "mini_magick", "~> 4.12"

# gem "recaptcha", "~> 5.12"
gem "invisible_captcha", "~> 2.1"

gem "bullet", "~> 7.0"

gem "pagy", "~> 6.0"

gem "meta-tags", "~> 2.18"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0"
  gem "rails-controller-testing", "~> 1.0"
  gem "factory_bot_rails", "~> 6.2"  
  gem "letter_opener", "~> 1.8"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Deploy
  gem 'capistrano', '~> 3.18', require: false  
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-passenger', '~> 0.2.0', require: false
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4', require: false
  #gem "capistrano3-unicorn", "~> 0.2.1", require: false
  #gem 'capistrano-bundler', require: false
  #gem 'capistrano-sidekiq', require: false  
  #gem 'capistrano-rvm', require: false

  gem "ed25519", "~> 1.3", require: false
  gem "bcrypt_pbkdf", "~> 1.1", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver", "~> 4.7.1"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 5.2"
  gem "launchy", "~> 2.5"
  gem "database_cleaner-active_record", "~> 2.0"
  gem 'pundit-matchers', '~> 1.8.4'
  # gem "rack_session_access", "~> 0.2.0"
end

