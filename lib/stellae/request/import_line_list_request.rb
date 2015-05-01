module Stellae
  module Request
    class ImportLineListRequest
      def initialize(
        line_list_rows:
      )
        @line_list_rows = line_list_rows
      end

      attr_reader :line_list_rows
    end
  end
end
