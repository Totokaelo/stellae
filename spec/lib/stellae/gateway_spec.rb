require 'spec_helper'

describe Stellae::Gateway do
  let(:username) { 'TOTOKAELO' }
  let(:password) { 'fP4#WNZtu5Gf' }

  subject {
    described_class.new(
      endpoint_url: 'https://webservice.stellae.us/SIIServices_multi/Siiservice.svc',
      username: username,
      password: password,
      logger: Logger.new(STDOUT)
    )
  }

  let(:get_catalog_information_request) {
    Stellae::Request::CatalogInformationRequest.new
  }

  it 'connects' do
    response = subject.get_catalog_information(
      get_catalog_information_request
    )

    expect(response.success?).to be true
  end

  describe '#import_line_list' do
    let(:hat_line_list_row) {
      llr = Stellae::Request::LineListRow.new
      llr.season_code = 'SS15'
      llr.upc = 'tktest0001'
      llr.description = 'cool hat'
      llr.style = 'black ballcap'
      llr.color_code = '001'
      llr.size_code = '0'

      llr
    }

    let(:import_line_list_request) {
      Stellae::Request::ImportLineListRequest.new([
        hat_line_list_row
      ])
    }

    it 'returns success' do
      response = subject.import_line_list(
        import_line_list_request
      )

      expect(response.success?).to be true
    end
  end
end
