require 'spec_helper'
describe 'x11packages' do

  context 'with defaults for all parameters' do
    it { should contain_class('x11packages') }
  end
end
