module Stellae
  module Request
    class CatalogInformationRequest < Base
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

      def root_tag_name
        'cir'
      end

      def each_option
        yield 'upc', upc
        yield 'style', style
        yield 'season_code', season_code
        yield 'flags', flags
      end

      private

      attr_reader :upc, :style, :season_code, :flags
    end
  end
end
