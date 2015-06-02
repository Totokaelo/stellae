require 'spec_helper'

describe Stellae::Order do
  subject { described_class.new }

  describe '#service' do
    it 'pads with 0 for single digits' do
      subject.service = 2
      expect(subject.service).to eq('02')
    end
  end
end
