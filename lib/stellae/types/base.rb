module Stellae
  module Types
    class Base
      class << self
        @@attributes = {}
        @@root_name = nil

        def root_name(key)
          @@root_name = key
        end

        def string(key)
          define_writers(key, :string)
        end

        def datetime(key)
          define_writers(key, :datetime)
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
          @@attributes[key]
        end

        private

        def define_writers(key, type)
          @@attributes[key] = type

          # define key=(value)
          attr_accessor key
        end
      end

      # Instance Methods

      def initialize(argument_hash = {})
        argument_hash.each_key do |k|
          send("#{k}=", argument_hash[k])
        end
      end

      def root_name
        @@root_name
      end

      def attribute_keys
        @@attributes.keys
      end

      def get_attribute(key)
        instance_variable_get("@#{key}")
      end

      def get_attribute_type(key)
        @@attributes[key]
      end
    end
  end
end
