# gpg_key

The gpg_key module lets you manage GPG keys with Puppet.

## Support

Tested using

* CentOS 5.9
* CentOS 6.4
* Fedora 18

## Usage

### 

## Reference

Types:

* [gpg_key](#type-gpg_key)

### Type: firewall

This type provides the capability to manage GPG keys within Puppet.

####`ensure`

####`path`

## Development

### Testing

Make sure you have:

* rake
* bundler

Install the necessary gems:

    bundle install

Run the tests from root of the source code:

    bundle exec rake ci

If you have Vagrant >= 1.1.0 you can also run system tests:

    bundle exec rake spec:system
    RSPEC_SET=centos-59-x64 bundle exec rake spec:system
    RSPEC_SET=fedora-18-x64 bundle exec rake spec:system


## Further Information

*
