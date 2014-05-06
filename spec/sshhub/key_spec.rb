require 'spec_helper'

describe Sshhub::Key do
  let(:key){ Sshhub::Key.new(id: 1, key: 'abc') }

  context 'Initialization' do
    it 'accepts a hash of options' do
      expect(key.id).to eq(1)
      expect(key.key).to eq('abc')
    end
  end

  context 'Output' do
    it 'provides an abridged key' do
      key.key = 'abcdefghijklmnopqrstuvwxyz'
      expect(key.abridged).to eq('abcdefghijklmnop ... lmnopqrstuvwxyz')
    end

    it 'returns the key when coerced to string' do
      expect(key.to_s).to eq(key.key)
    end
  end
end
