require 'spec_helper'
describe 'rhel7repos' do

  context 'with defaults for all parameters' do
    it { should contain_class('rhel7repos') }
  end
end
