require 'spec_helper'

describe Stellae::PurchaseOrderReceiptsResponse do
  let(:request) { Stellae::PurchaseOrderReceiptsRequest.new }

  subject { gateway.execute(request) }
end
