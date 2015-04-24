require 'spec_helper'

describe Stellae do
  subject { described_class }

  describe '::test' do
    it 'should not suck' do
      expect(subject.derp).to eq 'test'
    end
  end
end
