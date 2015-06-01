require 'stellae/response/base_response'

module Stellae
  module Response
    def self.for(request, response)
      Stellae::Response::BaseResponse.new(
        request: request,
        response: response
      )
    end
  end
end
