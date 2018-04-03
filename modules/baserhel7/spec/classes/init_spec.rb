require 'spec_helper'
describe 'baserhel7' do

  context 'with defaults for all parameters' do
    it { should contain_class('baserhel7') }
  end
end
