require 'spec_helper'
describe 'oracle12201' do

  context 'with defaults for all parameters' do
    it { should contain_class('oracle12201') }
  end
end
