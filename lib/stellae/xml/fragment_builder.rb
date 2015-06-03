# for iso8601
require 'time'

module Stellae
  module Xml
    class FragmentBuilder
      def initialize(
        object,
        write_namespace_attributes_on_root: true,
        capitalize_attribute_tags: false
      )
        @object = object
        @write_namespace_attributes_on_root = write_namespace_attributes_on_root
        @capitalize_attribute_tags = capitalize_attribute_tags
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
            # hate hate hate
            # tag_name(object_root_name)
            "#{namespace}:#{object_root_name}"
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
                # This is terrible
                capitalize_attributes = v.is_a?(Stellae::OrderDetail)

                fragment_builder = FragmentBuilder.new(
                  v,
                  write_namespace_attributes_on_root: false,
                  capitalize_attribute_tags: capitalize_attributes
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
        if @capitalize_attribute_tags
          "#{namespace}:#{object_key.upcase}"
        else
          "#{namespace}:#{object_key}"
        end
      end

      def each_attribute
        keys_sorted_for_serialization.each do |key|
          yield(key, value_or_default(key))
        end
      end

      # Most messages require alphabetical sorting, but some don't.
      # Override this in specific builder classes if you need something more
      #
      def keys_sorted_for_serialization
        # Default to Case-insensitive alphabetization
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
        if value.is_a?(Time) || value.is_a?(DateTime)
          # Endpoint will only read ISO8601, sans timezone
          # so return iso8601 but strip the timezone
          #
          # ex: "2015-06-03T20:19:16Z" -> "2015-06-03T20:19:16"
          #
          value.iso8601[0...19]
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
