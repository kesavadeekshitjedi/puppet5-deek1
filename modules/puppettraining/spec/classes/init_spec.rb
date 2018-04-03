require 'spec_helper'
describe 'puppettraining' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppettraining') }
  end
end
