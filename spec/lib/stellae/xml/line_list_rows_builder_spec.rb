require 'spec_helper'

describe Stellae::Xml::LineListRowsBuilder do
  let(:line_list_row_xml) do
    '<internal>xml</internal>'
  end

  describe '#xml' do
    subject { described_class.new(line_list_row_xml).xml }

    it 'should write with namespaces' do
      expect(subject).to start_with('<line_list_rows xmlns:a="http://schemas.datacontract.org/2004/07/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">')
    end

    it 'should stuff internal xml' do
      expect(subject).to include(line_list_row_xml)
    end
  end
end
