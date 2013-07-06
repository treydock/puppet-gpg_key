Puppet::Type.type(:gpg_key).provide(:rpm) do

  commands :rpm => "/bin/rpm"
  commands :gpg => "/usr/bin/gpg"

  confine :osfamily => :redhat

  def exists?
    gpg_pubkeys = rpm("--query", "--queryformat", "%{VERSION}\n", "gpg-pubkey").split("\n")
    Puppet.debug("gpg_pubkeys -> #{gpg_pubkeys.inspect}")
    gpg_pubkeys.include?(keyid)
  end

  def create
    rpm("--import", resource[:path])
  end

  def destroy
    rpm("--erase", name_version)
  end

  private

  def keyid
    info = gpg("--throw-keyids", resource[:path])
    Puppet.debug("keyid -> #{info[11..18].downcase}")
    info[11..18].downcase
  end

  def name_version
    "gpg-pubkey-#{keyid}"
  end
end
