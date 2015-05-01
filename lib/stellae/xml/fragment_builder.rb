module Stellae
  module Xml
    class FragmentBuilder
      class << self
        @@attributes = {}

        def string(key)
          define_writers(key, :string)
        end

        def decimal(key)
          define_writers(key, :decimal)
        end

        def define_writers(key, type)
          @@attributes[key] = type

          # define key=(value)
          attr_accessor key
        end

        def attribute_type(key)
          @@attributes[key]
        end

        def alphabetized_keys
          @@attributes.keys.sort
        end
      end

      def initialize(argument_hash = {})
        argument_hash.each_key do |k|
          send("#{k}=", argument_hash[k])
        end
      end

      def xml
        xml_builder = Builder::XmlMarkup.new

        self.class.alphabetized_keys.each do |key|
          write_tag(
            xml_builder,
            key,
            value_or_default(key)
          )
        end

        xml_builder.target!
      end

      protected

      def write_tag(x, tag_name, value)
        if value.nil?
          x.tag! "#{namespace}:#{tag_name}", 'i:nil' => true
        else
          x.tag! "#{namespace}:#{tag_name}", value
        end
      end

      def value_or_default(key)
        value = instance_variable_get("@#{key}")

        return value unless value.nil?

        if @@attributes[key] == :decimal
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
