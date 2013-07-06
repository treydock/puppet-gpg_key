require 'spec_helper_system'

describe 'basic tests:' do
  context puppet_agent do
    its(:stderr) { should be_empty }
    its(:exit_code) { should_not == 1 }
  end
end
