require 'spec_helper'
describe 'httpmod' do
  context 'with default values for all parameters' do
    it { should contain_class('httpmod') }
  end
end
