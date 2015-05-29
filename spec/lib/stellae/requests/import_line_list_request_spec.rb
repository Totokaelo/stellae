require 'spec_helper'

describe Stellae::Requests::ImportLineListRequest do
  let(:line_list_rows) { [hat_line_list_row] }

  subject {
    described_class.new(line_list_rows: line_list_rows)
  }

  let(:hat_line_list_row) {
    llr = Stellae::Types::LineListRow.new
    llr.upc = 'tktest0001'
    llr.description = 'cool hat'
    llr.style = 'black ballcap'
    llr.color_code = '001'
    llr.size_code = '0'
    llr.activity = 'Maison Martin Margiela'
    llr.activity_code = 123
    llr.alternate_code = nil
    llr.color = 'Black'
    llr.content = nil
    llr.country_of_origin = 'US'

    llr.currency_code = 'USD'
    llr.cost = 100
    llr.retail_price = 150
    llr.wholesale_price = 100

    llr.fabric_code = nil
    llr.htscode = nil
    llr.imageurl = 'http://totokaelo.com/'
    llr.price_group = 'ghi' # wtf is this
    llr.season_code = '33'

    llr.size = 'One Size'
    llr.size_code = 'OS'
    llr.size_order = 1

    llr
  }

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
