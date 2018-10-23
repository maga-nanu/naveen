require 'spec_helper'
describe 'multiclass_http' do
  context 'with default values for all parameters' do
    it { should contain_class('multiclass_http') }
  end
end
