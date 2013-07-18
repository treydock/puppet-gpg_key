require 'spec_helper'

provider_class = Puppet::Type.type(:gpg_key).provider(:rpm)

describe provider_class do
  subject { provider_class }

  before :each do
    @resource = Puppet::Type::Gpg_key.new({:path => '/tmp/path'})
    @provider = provider_class.new(@resource)
    Puppet::Util.stubs(:which).with('rpm').returns('/bin/rpm')
    Puppet::Util.stubs(:which).with('gpg').returns('/usr/bin/gpg')
    subject.stubs(:which).with('rpm').returns('/bin/rpm')
    subject.stubs(:which).with('gpg').returns('/usr/bin/gpg')
  end

  let(:keyid) { '4bd6ec30' }

  let(:gpg_pubkey_versions) do
    <<-RPM_OUTPUT
c105b9de
4bd6ec30
0608b895
    RPM_OUTPUT
  end

  let(:gpg_throw_keyids) { 'pub  4096R/4BD6EC30 2010-07-10 Puppet Labs Release Key (Puppet Labs Release Key) <info@puppetlabs.com>' }

  describe 'create' do
    it 'imports a GPG key' do
      subject.expects(:rpm).with(["--import", "#{@resource[:path]}"])
      @provider.create
    end
  end

  describe 'destroy' do
    before :each do
      @resource = Puppet::Type::Gpg_key.new({:ensure => :absent, :path => '/tmp/path'})
    end

    it 'erase a GPG key' do
      @provider.stubs(:keyid).returns(keyid)
      subject.expects(:rpm).with(["--erase", "gpg-pubkey-#{keyid}"])
      @provider.destroy
    end
  end

  describe 'exists?' do
    it 'check if gpg key exists' do
      @provider.stubs(:keyid).returns(keyid)
      subject.expects(:rpm).with(["--query", "--queryformat", '%{VERSION}\n', "gpg-pubkey"]).returns(gpg_pubkey_versions)
      @provider.exists?.should be_true
    end

    it 'check if gpg key does not exist' do
      @provider.stubs(:keyid).returns('foo')
      subject.expects(:rpm).with(["--query", "--queryformat", '%{VERSION}\n', "gpg-pubkey"]).returns(gpg_pubkey_versions)
      @provider.exists?.should be_false
    end
  end

  describe 'keyid' do
    it 'return keyid used by RPM' do
      subject.expects(:gpg).with(["--quiet", "--throw-keyids", @resource[:path]]).returns(gpg_throw_keyids)
      @provider.keyid.should == keyid
    end
  end
end
