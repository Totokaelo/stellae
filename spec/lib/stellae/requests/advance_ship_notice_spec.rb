require 'spec_helper'

describe Stellae::Requests::AdvanceShipNoticeRequest do
  subject {
    described_class.new(
      asn_lines: advance_ship_notice_line_items

    )
  }

  let(:advance_ship_notice_line_items) { [] }
  let!(:response) { gateway.execute(subject) }

  describe '#root_name' do
    it 'should be ahn' do
      expect(subject.root_name).to eq(:ahn)
    end
  end

  it 'succeeds' do
    expect(response.success?).to be true
  end

  it 'returns correct response type' do
    expect(response.is_a?(Stellae::AdvanceShipNoticeResponse)).to be true
  end
end
