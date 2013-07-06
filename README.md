# puppet-rpm_gpg_key

UNKNOWN

## Support

Tested using
* CentOS 5.9
* CentOS 6.4

## Usage

## Development

### Dependencies

* Ruby 1.8.7
* Bundler
* Vagrant >= 1.2.0

### Unit testing

1. To install dependencies run `bundle install`
2. Run tests using `bundle exec rake ci`

### Vagrant system tests

1. Have Vagrant >= 1.2.0 installed
2. Run tests using `bundle exec rake spec:system`

For active development the `RSPEC_DESTROY=no` environment variable can be passed to keep the Vagrant VM from being destroyed after a test run.

    RSPEC_DESTROY=no bundle exec rake spec:system

To test on CentOS 5.9 run the following:

    RSPEC_SET=centos-59-x64 bundle exec rake spec:system

## Further Information

*
