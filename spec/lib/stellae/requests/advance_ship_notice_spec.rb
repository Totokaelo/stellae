require 'spec_helper'

# For '2 days ago etc'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/numeric/time'

describe Stellae::AdvanceShipNoticeRequest do
  #let(:line_list_row) { FactoryGirl.build(:line_list_row, description: "An updated test value") }
  #let(:line_list_request) { Stellae::Requests::ImportLineListRequest.new(line_list_rows: [line_list_row]) }

  # Always execute the LLR for now
  #let!(:line_list_response) { gateway.execute(line_list_request) }

  let(:existing_sku) { '0000001437073116' }

  subject {
    described_class.new(
      asn_lines: advance_ship_notice_line_items,
      invoice_date: 2.days.ago,
      ship_date: 2.weeks.from_now,

      poref1: invoice_number,
      poref2: po_number
    )
  }

  let(:invoice_number) { 'ABC123' }
  let(:po_number) { 'ABC123' }

  let(:advance_ship_notice_line_item) {
    FactoryGirl.build(:advance_ship_notice_line_item, sku: existing_sku)
  }

  let(:advance_ship_notice_line_items) {
    [advance_ship_notice_line_item]
  }

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
