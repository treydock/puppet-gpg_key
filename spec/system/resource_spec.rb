require 'spec_helper_system'

describe 'gpg_key tests:' do
  pp = <<-EOS
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6':
      ensure  => present,
      source  => 'file:///etc/puppet/modules/gpg_key/spec/fixtures/RPM-GPG-KEY-EPEL-6',
    }
    gpg_key { 'epel':
      path  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
    }
  EOS

  context puppet_apply pp do
    its(:stderr) { should be_empty }
    its(:exit_code) { should_not == 1 }
    its(:refresh) { should be_nil }
    its(:stderr) { should be_empty }
    its(:exit_code) { should be_zero }
  end
end
