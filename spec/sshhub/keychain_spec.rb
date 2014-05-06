require 'spec_helper'

describe Sshhub::Keychain do
  let(:keychain){ Sshhub::Keychain.new('mwerner') }

  context 'Initialization' do
    it 'accepts a github username' do
      expect(keychain.username).to eq('mwerner')
    end
  end
end
