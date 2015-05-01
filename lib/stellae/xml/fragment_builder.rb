module Stellae
  module Xml
    class FragmentBuilder
      def initialize(object)
        @object = object
      end

      def xml
        xml_builder = Builder::XmlMarkup.new

        if object_root_name
          xml_builder.tag!(object_root_name, namespaces) do
            write_attributes(xml_builder)
          end
        else
          write_attributes(xml_builder)
        end


        xml_builder.target!
      end

      protected

      def object_root_name
        @object.root_name
      end

      def object_attribute_keys
        @object.attribute_keys
      end

      def object_get_attribute(key)
        @object.get_attribute(key)
      end

      def object_get_attribute_type(key)
        @object.get_attribute_type(key)
      end

      def write_attributes(xml_builder)
        each_attribute do |key, value|
          write_tag(
            xml_builder,
            key,
            value
          )
        end
      end

      def write_tag(x, tag_name, value)
        if value.nil?
          x.tag! "#{namespace}:#{tag_name}", 'i:nil' => true
        else
          x.tag! "#{namespace}:#{tag_name}", value
        end
      end

      def each_attribute
        alphabetized_keys.each do |key|
          yield(key, value_or_default(key))
        end
      end

      def alphabetized_keys
        object_attribute_keys.sort
      end

      def value_or_default(key)
        value = object_get_attribute(key)

        unless value.nil?
          value
        else
          default(object_get_attribute_type(key))
        end
      end

      def default(type)
        if type == :decimal
          0
        else
          nil
        end
      end

      def namespace
        Stellae::Xml::TAG_NAMESPACE
      end

      def namespaces
        Stellae::Xml::NAMESPACES
      end
    end
  end
end
