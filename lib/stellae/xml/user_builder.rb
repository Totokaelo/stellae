module Stellae
  module Xml
    # Builds a <user> fragment
    class UserBuilder < FragmentBuilder
      def initialize(username:, password:)
        @username = username
        @password = password
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.tag!(
          'user',
          namespaces
        ) do |u|
          u.tag! "#{namespace}:user_name", @username
          u.tag! "#{namespace}:user_password", @password
        end

        xml_markup.target!
      end
    end
  end
end
