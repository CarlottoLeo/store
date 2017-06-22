source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'

gem 'rails-erd'
gem 'googlecharts'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'prawn-rails'
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'therubyracer'
gem 'devise'
gem 'rails-i18n'
gem 'select2-rails'
gem 'ransack'
gem 'audited', '~> 4.3'
gem 'rails-observers', github: 'rails/rails-observers'
gem 'font-awesome-rails'
gem 'cocoon'
gem 'paranoia'
gem 'pundit'
gem 'pg'
gem 'validates_cpf_cnpj'
gem 'will_paginate', '~> 3.1.0'
gem 'chartjs-ror'
gem 'coffee-rails'
gem 'less-rails'
gem 'nfe-io'

# testing stuff
group :development, :test do
  # cpf generator
  gem 'cpf_cnpj'
  gem 'faker'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
end

group :test do
  gem 'launchy'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
end

gem 'mailcatcher'
