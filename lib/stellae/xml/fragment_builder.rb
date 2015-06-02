# for iso8601
require 'time'

module Stellae
  module Xml
    class FragmentBuilder
      def initialize(object, write_namespace_attributes_on_root: true)
        @object = object
        @write_namespace_attributes_on_root = write_namespace_attributes_on_root
      end

      def xml
        xml_builder = Builder::XmlMarkup.new

        if object_root_name
          namespace_to_write = @write_namespace_attributes_on_root ? namespaces : nil
          root_name = if @write_namespace_attributes_on_root
            # Do NOT preface with namespace
            object_root_name
          else
            # DO preface with namespace
            tag_name(object_root_name)
          end

          xml_builder.tag!(
            root_name,
            namespace_to_write
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

      def write_attributes(xml_builder)
        each_attribute do |key, value|
          attribute_type = @object.get_attribute_type(key)

          tag = tag_name(key)

          if value.nil?
            xml_builder.tag! tag, 'i:nil' => true
          elsif attribute_type == :collection
            xml_builder.tag! tag do |x|
              value.each do |v|
                fragment_builder = FragmentBuilder.new(
                  v,
                  write_namespace_attributes_on_root: false
                )

                x << fragment_builder.xml
              end
            end
          else
            xml_builder.tag! tag, value
          end
        end
      end

      def tag_name(object_key)
        "#{namespace}:#{object_key}"
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
        # Get the type of the attribute
        attribute_type = @object.get_attribute_type(key)

        # Get the native value of the attribute
        value = @object.get_attribute(key)

        default = default(attribute_type)

        present(value || default)
      end

      def default(type)
        case type
        when :integer
          0
        when :decimal
          0.0
        when :datetime
          Time.now
        else
          nil
        end
      end

      def present(value)
        if value.is_a?(Time)
          value.iso8601
        else
          # nothing to do
          value
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
