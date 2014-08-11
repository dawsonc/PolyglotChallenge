source 'https://rubygems.org'

# Infrastructure/Defaults
gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'unicorn'
gem 'rails_12factor', group: :production

# Do it with style
gem 'slim'
gem 'slim-rails'
gem 'bourbon'
gem 'neat'
gem 'bitters'
gem 'refills'

# Make life easier
group :development do
  gem 'better_errors' # Dat REPL tho...
  gem 'binding_of_caller' # Dependency of above

  gem 'annotate' # No more keeping schema.rb open in another tab

  gem 'awesome_print' # My eyes will thank me

  gem 'byebug' # Sometimes you just gotta debug
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-its'

  gem 'factory_girl'

  gem 'timecop'

  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-shell'
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent'

  gem 'capybara'

  gem 'shoulda-matchers'
end

ruby '2.1.2'