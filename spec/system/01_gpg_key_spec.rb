require 'spec_helper_system'

describe 'gpg_key tests:' do
  context "adding gpg key" do
    it "should run successfully" do
      pp = <<-EOS
        file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6':
          ensure  => present,
          source  => 'file:///etc/puppet/modules/gpg_key/spec/fixtures/RPM-GPG-KEY-EPEL-6',
        }
        gpg_key { 'epel':
          path  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        }
      EOS

      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end
  end

  context "when no gpg keys present" do
    it "should remove all gpg-pubkeys" do
      shell "rpm -e --allmatches gpg-pubkey-*" do |r|
        r.exit_code.should be_zero
      end
    end

    it "should run successfully" do
      pp = <<-EOS
        file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6':
          ensure  => present,
          source  => 'file:///etc/puppet/modules/gpg_key/spec/fixtures/RPM-GPG-KEY-EPEL-6',
        }
        gpg_key { 'epel':
          path  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        }
      EOS

      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end    
  end
end
