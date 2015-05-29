module Stellae
  module Requests
    # Register an Item(s) with Stellae.
    # UPC is the primary key for the Item.
    class ImportLineListRequest < Base
      endpoint_name :import_line_list

      collection :line_list_rows
    end
  end
end
