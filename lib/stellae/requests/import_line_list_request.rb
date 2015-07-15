module Stellae
  module Requests
    # Register an Item(s) with Stellae.
    # UPC is the primary key for the Item.
    class ImportLineListRequest < Base
      endpoint_name :import_line_list
      root_name :line_list_rows

      collection :line_list_rows
    end
  end
end
