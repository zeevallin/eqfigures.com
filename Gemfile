source 'https://rubygems.org'
ruby   '2.0.0'

gem 'rails', '4.1.0.rc1'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'figaro', :github=>"laserlemon/figaro"
gem 'haml-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'pg'
gem 'pundit'
gem 'simple_form'
gem 'thin'
gem 'elo'
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'zeus'
end

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
