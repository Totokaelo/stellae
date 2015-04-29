module Stellae
  module Request
    class CatalogInformationRequest
      def initialize(
        upc: nil,
        style: nil,
        season_code: nil,
        flags: nil
      )
        @upc = upc
        @style = style
        @season_code = season_code
        @flags = nil
      end

      attr_reader :upc, :style, :season_code, :flags
    end
  end
end
