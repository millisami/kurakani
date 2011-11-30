source "http://rubygems.org"

group :assets do
  gem 'compass', git: 'https://github.com/chriseppstein/compass.git', tag: "v0.12.alpha.2"
  gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :git => 'git://github.com/anjlab/bootstrap-rails.git'
end

gem 'twitter_bootstrap_form_for'                              

group :development, :test do
  gem 'sqlite3'
  gem 'sorcery'
  gem 'pry'
  gem 'pry-doc'
end

if RUBY_VERSION < '1.9'
  gem "ruby-debug", "~> 0.10.3"
else
  gem "ruby-debug19", :require => 'ruby-debug'
end
gemspec
