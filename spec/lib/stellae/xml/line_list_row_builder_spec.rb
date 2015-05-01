require 'spec_helper'

describe Stellae::Xml::LineListRowBuilder do
  let(:upc) { 'TKTEST01234' }
  let(:season_code) { 'SS15' }
  let(:description) { 'A cool black hat. One size.' }
  let(:style) { 'Black Hat' }
  let(:color_code) { '001' }
  let(:size_code) { '001' }
  let(:content) { nil }

  let(:line_list_row) {
    llr = Stellae::Types::LineListRow.new
    llr.season_code = season_code
    llr.upc = upc
    llr.description = description
    llr.style = style
    llr.color_code = color_code
    llr.size_code = size_code
    llr.content = content

    llr
  }

  describe "#xml" do
    subject { described_class.new(line_list_row).xml }

    it 'should add appropriate namespace' do
      expect(subject).to include('<a:Line_list_row>')
    end

    it 'should report nil correctly' do
      expect(subject).to include('<a:content i:nil="true"/>')
    end
  end
end
