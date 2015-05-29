module Stellae
  module Xml
    class FragmentBuilder
      def initialize(object, write_namespace_on_root: true)
        @object = object
        @write_namespace_on_root = write_namespace_on_root
      end

      def xml
        xml_builder = Builder::XmlMarkup.new

        if object_root_name
          xml_builder.tag!(
            object_root_name,
            @write_namespace_on_root ? namespaces : nil
          ) do
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

      def tag_name(object_key)
        "#{namespace}:#{object_key}"
      end

      def write_tag(x, key, value)
        tag = tag_name(key)

        if value.nil?
          x.tag! tag, 'i:nil' => true
        else
          x.tag! tag, value
        end
      end

      def each_attribute
        alphabetized_keys.each do |key|
          yield(key, value_or_default(key))
        end
      end

      def alphabetized_keys
        # Case-insensitive alphabetization
        object_attribute_keys.sort { |a, b| a.downcase <=> b.downcase }
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
