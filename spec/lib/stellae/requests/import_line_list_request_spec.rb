require 'spec_helper'

describe Stellae::Requests::ImportLineListRequest do
  let(:line_list_rows) { [hat_line_list_row] }

  subject {
    described_class.new(line_list_rows: line_list_rows)
  }

  let(:hat_line_list_row) { build(:line_list_row, description: "An updated test value") }


  it 'succeeds' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end

  describe '#root_name' do
    it 'should be line_list_rows' do
      expect(subject.root_name).to eq(:line_list_rows)
    end
  end
end
