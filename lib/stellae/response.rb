module Stellae
  class Response
    attr_reader :request,
      :status

    def initialize(request:, status:)
      @request = request
      @status = status.to_i
    end

    def status_message
      Stellae::StatusCodes[status]
    end

    def success?
      @status == 1
    end
  end
end
