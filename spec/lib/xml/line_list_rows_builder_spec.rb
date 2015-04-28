require 'spec_helper'

describe Stellae::Xml::LineListRowsBuilder do
  let(:line_list_row_xml) do
    '<internal>xml</internal>'
  end

  describe '#xml' do
    subject { described_class.new(line_list_row_xml).xml }

    it 'should stuff internal xml' do
      expect(subject).to include(line_list_row_xml)
    end
  end
end
