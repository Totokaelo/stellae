module Stellae
  #
  class ResponseParser
    def initialize(response)
      @response = response
    end

    def status
      response.body.first[1].first[1].fetch(:status)
    end

    private

    attr_reader :response
  end
end
