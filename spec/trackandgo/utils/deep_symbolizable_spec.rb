require 'spec_helper'

describe 'Hash#deep_symbolize' do
  let(:hash) {{}}
  subject do
    hash.extend DeepSymbolizable
    hash.deep_symbolize
  end

  context 'on simple hash' do
    let(:hash) {{ :key1 => 'val1', 'key2' => 'val2' }}
    it { should == { :key1 => 'val1', :key2 => 'val2' } }
  end

  context 'on nested hash' do
    let(:hash) {{ 'key1' => 'val1', 'subkey' => { 'key2' => 'val2' } }}
    it { should == { :key1 => 'val1', :subkey => { :key2 => 'val2' } } }
  end

  context 'on a hash with nested array' do
    let(:hash) {{ 'key1' => 'val1', 'subkey' => [{ 'key2' => 'val2' }] }}
    it { should == { :key1 => 'val1', :subkey => [{ :key2 => 'val2' }] } }
  end

  describe 'preprocessing keys' do
    subject do
      hash.extend DeepSymbolizable
      hash.deep_symbolize { |k| k.upcase }
    end
    let(:hash) {{ 'key1' => 'val1', 'subkey' => [{ 'key2' => 'val2' }] }}
    it { should == { :KEY1 => 'val1', :SUBKEY => [{ :KEY2 => 'val2' }] } }
  end
end
