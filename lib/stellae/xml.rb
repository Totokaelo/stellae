module Stellae
  module Xml
    TAG_NAMESPACE = 'a'
    INSTANCE_NAMESPACE = 'i'

    NAMESPACES = {
      "xmlns:#{TAG_NAMESPACE}" => 'http://schemas.datacontract.org/2004/07/',
      "xmlns:#{INSTANCE_NAMESPACE}" => 'http://www.w3.org/2001/XMLSchema-instance'
    }

    SII_XMLNS_DEFINITION = {
      xmlns: 'SII'
    }
  end
end
