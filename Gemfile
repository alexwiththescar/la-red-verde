source 'http://rubygems.org'
gem 'rails', '3.2.13'

gem 'bootstrap-sass', '~> 2.3.0.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '~> 1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'jquery-rails', "2.3.0"
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
              
gem 'geocoder'

gem "wice_grid"
gem 'haml-rails'

gem "acts_as_follower"
gem 'simple_form'
#gem 'messaging', git: 'git://github.com/frodefi/rails-messaging.git'
#gem 'mailboxer', git: 'git://github.com/ging/mailboxer.git'

gem 'simple-private-messages', '0.0.0', :git => 'git://github.com/jongilbraith/simple-private-messages.git'
gem  'dynamic_form'
group :development do

gem 'pg'

 	
gem 'annotate', '~> 2.4.1.beta'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
gem 'sass-rails', '3.2.4'
gem 'coffee-rails', '3.2.2'
gem 'uglifier', '1.2.3'
end

group :test, :development do
gem 'rspec-rails', '2.10.0'
gem 'guard-rspec', '0.5.5'
gem 'guard-spork', '0.3.2'
gem 'spork', '0.9.0'
end
group :test do
gem 'capybara', '1.1.2'
gem 'factory_girl_rails'
gem 'cucumber-rails', '1.2.1', require: false
gem 'database_cleaner', '0.7.0'
end
group :production do
gem 'thin'
gem 'pg'
end