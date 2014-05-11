require 'spec_helper'

describe Sshhub::PortAuthority do
  let(:key){ Sshhub::Key.new(id: 1, key: 'ssh-rsa abc123') }
  let(:file){ double(read: "ssh-rsa abc123\nssh-dss 987zyx") }

  before do
    allow(File).to receive(:open).and_return(file)
  end

  context 'Authorizing a key' do
    before do
      allow(Sshhub::PortAuthority).to receive(:`).and_return('foo')
      allow(Sshhub::PortAuthority).to receive(:system).and_return(true)
    end

    it 'writes to authorized_keys' do
      Sshhub::PortAuthority.authorize(key)
    end
  end

  context 'Revoking a key' do
    before do
      allow(Sshhub::PortAuthority).to receive(:`).and_return('foo')
      allow(Sshhub::PortAuthority).to receive(:system).and_return(true)
    end

    it 'writes to authorized_keys' do
      Sshhub::PortAuthority.revoke(key)
    end
  end

  context 'Key presence' do
    it 'does not require authorized_keys to be present' do
      expect(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(Sshhub::PortAuthority.present?(key)).to be(false)
    end

    it 'can tell if a key is present in authorized_keys' do
      expect(Sshhub::PortAuthority.present?(key)).to eq(true)
    end
  end
end
