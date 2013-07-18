Puppet::Type.type(:gpg_key).provide(:rpm) do

  @docs = "GPG Key type provider"

  optional_commands :rpm => "rpm"

  if Facter.fact('operatingsystem').value =~ /Fedora/
    Puppet.debug("FEDORA")
    optional_commands :gpg => "gpg2"
  else
    optional_commands :gpg => "gpg" 
  end

  defaultfor :osfamily => :redhat
  confine :osfamily => :redhat

  def exists?
    rpm(["--query", "--queryformat", '%{VERSION}\n', "gpg-pubkey"].compact) =~ /^#{keyid}$/
  end

  def create
    rpm(["--import", @resource[:path]].compact)
  end

  def destroy
    rpm(["--erase", "gpg-pubkey-#{keyid}"].compact)
  end

  def keyid
    gpg(["--quiet", "--throw-keyids", @resource[:path]].compact)[11..18].downcase
  end
end
