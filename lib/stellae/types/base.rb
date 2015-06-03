require 'date'

module Stellae
  module Types
    class Base
      class << self
        def root_name(key)
          define_method(:root_name) { key }
        end

        def string(key)
          define_writers(key, :string)
        end

        def datetime(key)
          define_writers(key, :datetime)
        end

        def integer(key)
          define_writers(key, :integer)
        end

        def decimal(key)
          define_writers(key, :decimal)
        end

        def entity(key)
          define_writers(key, :entity)
        end

        def collection(key)
          define_writers(key, :collection)
        end

        def attribute_type(key)
          attributes[key]
        end

        def attributes
          @attributes ||= {}
        end

        private

        def define_writers(key, type)
          # Assign Type
          attributes[key] = type

          # Define Reader
          attr_reader key

          # Define Writer

          case type
          when :integer
            define_method("#{key}=".intern) { |v| instance_variable_set("@#{key}".intern, v.to_i) }

          when :decimal
            define_method("#{key}=".intern) { |v| instance_variable_set("@#{key}".intern, v.to_f) }

          else
            attr_writer key

          end
        end
      end

      # Instance Methods

      def initialize(argument_hash = {})
        argument_hash.each_key do |k|
          send("#{k}=", argument_hash[k])
        end
      end

      def attribute_keys
        self.class.attributes.keys
      end

      def get_attribute(key)
        instance_variable_get("@#{key}")
      end

      def get_attribute_type(key)
        self.class.attributes[key]
      end

      def root_name
        nil
      end
    end
  end
end
