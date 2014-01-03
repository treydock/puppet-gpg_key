source "http://rubygems.org"

group :development, :test do
  gem 'rake',                                 :require => false
  gem 'puppetlabs_spec_helper',               :require => false
  gem 'puppet-lint',                          :require => false
  gem 'puppet-syntax',                        :require => false
  gem 'travis-lint',                          :require => false
  gem 'rspec-system-puppet', '~> 2.0',        :require => false
  gem 'serverspec', '~> 0.11.0',              :require => false
  gem 'rspec-system-serverspec', '~> 1.0.1',  :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end