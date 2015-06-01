require 'spec_helper'

describe Stellae::Gateway do
  let(:username) { ENV['STELLAE_USERNAME'] }
  let(:password) { ENV['STELLAE_PASSWORD'] }

  subject {
    Stellae::Gateway.new(
      endpoint_url: 'https://webservice.stellae.us/SIIServices_multi/Siiservice.svc',
      username: username,
      password: password,
      logger: Logger.new(STDOUT)
    )
  }

  let(:request) { build(:get_catalog_information_request) }

  context 'correct credentials' do
    let(:subject) { gateway }

    it 'works' do
      response = subject.execute(request)
      expect(response.success?).to be true
    end
  end

  context 'bad credentials' do
    let(:password) { 'badpassword' }

    it 'fails and returns 0002' do
      response = subject.execute(request)
      expect(response.success?).to be false
      expect(response.status).to eq(2)
    end
  end
end
