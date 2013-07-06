require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers

RSpec.configure do |c|
  # Project root for this module
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Enable colour in Jenkins
  c.tty = true

  # This is where we 'setup' the nodes before running our tests
  c.before :suite do
    # Install puppet
    puppet_install
    puppet_master_install

    shell('puppet module install puppetlabs-stdlib --modulepath /etc/puppet/modules --force')
    
    # Install rpm_gpg_key module
    puppet_module_install(:source => proj_root, :module_name => 'rpm_gpg_key')
  end
end
