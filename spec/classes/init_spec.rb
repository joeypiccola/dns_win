require 'spec_helper'
describe 'dns_win' do

  context 'with defaults for all parameters' do
    it { should contain_class('dns_win') }
  end
end
