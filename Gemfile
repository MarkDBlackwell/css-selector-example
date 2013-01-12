source :rubygems

ruby '1.9.3'
gem 'bundler', '>=1.3.0.pre.2'
# mdb August 9, 2011: 'heroku rake db:migrate' gave: 'uninitialized constant Rake:DSL'. Fix with: gem 'rake', '0.8.7' per:
# https://twitter.com/dhh/statuses/71966528744071169?_escaped_fragment_=/dhh/status/71966528744071169#!/dhh/status/71966528744071169
gem 'rake', '10.0.3'
gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  #gem 'sqlite3', '= 1.3.4'
  gem 'sqlite3'

  #gem 'mocha', '= 0.9.8'
  gem 'mocha'
end

# Use unicorn as the web server

# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
