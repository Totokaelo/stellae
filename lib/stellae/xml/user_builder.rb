module Stellae
  module Xml
    # Builds a <user> fragment
    class UserBuilder
      def initialize(username:, password:)
        @username = username
        @password = password
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.user(
          namespaces
        ) do |u|
          u.tag! "#{namespace}:user_name", @username
          u.tag! "#{namespace}:user_password", @password
        end

        xml_markup.target!
      end

      private

      def namespace
        Stellae::Xml::TAG_NAMESPACE
      end

      def namespaces
        Stellae::Xml::NAMESPACES
      end
    end
  end
end
