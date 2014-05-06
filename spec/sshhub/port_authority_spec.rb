require 'spec_helper'

describe Sshhub::PortAuthority do
  let(:key){ Sshhub::Key.new(id: 1, key: 'ssh-rsa abc123') }

  context 'Authorizing a key' do
    before do
      described_class.should_receive(:`).and_return('foo')
      described_class.should_receive(:system).with('mkdir', '-p', "/Users/foo/.ssh").and_return(true)
    end

    it 'writes to authorized_keys' do
      File.should_receive(:open)
      Sshhub::PortAuthority.authorize(key)
    end
  end
end
