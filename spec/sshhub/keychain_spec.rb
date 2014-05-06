require 'spec_helper'

describe Sshhub::Keychain do
  let(:keychain){ Sshhub::Keychain.new('mwerner') }

  context 'Initialization' do
    it 'accepts a github username' do
      expect(keychain.username).to eq('mwerner')
    end
  end

  context 'Keys' do
    it 'returns an array of keys' do
      Octokit::Client.any_instance.should_receive(:user_keys).and_return([{id: 1, key: 'abc'}])
      expect(keychain.keys).to be_a_kind_of(Array)
      expect(keychain.keys.first).to be_a_kind_of(Sshhub::Key)
    end

    it 'delegates length to the keys' do
      Octokit::Client.any_instance.should_receive(:user_keys).and_return([{id: 1, key: 'abc'}])
      expect(keychain.length).to eq(1)
    end
  end
end
