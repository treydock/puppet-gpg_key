require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |config|
  config.before :each do
    Facter.fact(:osfamily).stubs(:value).returns("RedHat")
  end
end
