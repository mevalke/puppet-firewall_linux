require 'spec_helper'
describe 'firewall_linux' do
  context 'with default values for all parameters' do
    it { should contain_class('firewall_linux') }
  end
end
