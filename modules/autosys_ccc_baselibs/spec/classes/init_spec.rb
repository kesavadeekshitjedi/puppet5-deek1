require 'spec_helper'
describe 'autosys_ccc_baselibs' do

  context 'with defaults for all parameters' do
    it { should contain_class('autosys_ccc_baselibs') }
  end
end
