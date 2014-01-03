require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'rspec-system/rake_task'

task :default do
  sh %{rake -T}
end

desc "Run puppet-syntax, puppet-lint and rspec-puppet tasks"
task :ci => [:syntax, :lint, :spec]

# Ignore files outside this module
PuppetLint.configuration.ignore_paths = ["pkg/**/*.pp", "vendor/**/*.pp", "spec/**/*.pp"]
PuppetSyntax.exclude_paths = ["pkg/**/*.pp", "vendor/**/*.pp", "spec/**/*.pp"]
