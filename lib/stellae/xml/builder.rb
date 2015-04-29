module Stellae
  module Xml
    class Builder
      protected

      def write_tag(x, tag_name, value)
        if value.nil?
          x.tag! "#{namespace}:#{tag_name}", 'i:nil' => true
        else
          x.tag! "#{namespace}:#{tag_name}", value
        end
      end

      def namespace
        Stellae::Xml::TAG_NAMESPACE
      end

      def namespace
        Stellae::Xml::TAG_NAMESPACE
      end
    end
  end
end
