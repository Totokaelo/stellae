module Stellae
  class RequestXmlBuilder
    def initialize(username:,password:,request:)
      @username = username
      @password = password
      @request = request
    end

    def xml
      @xml ||= build_xml
    end

    private

    def build_xml
      xml_markup = Builder::XmlMarkup.new

      add_user_element(xml_markup)
      add_request_element(xml_markup)

      xml_markup.target!
    end

    def add_user_element(xml_markup)
      user_builder = Stellae::Xml::UserBuilder.new(
        username: username,
        password: password
      )

      xml_markup << user_builder.xml

      nil
    end

    def add_request_element(xml_markup)
      if request
        xml_markup.tag!(
          request.root_tag_name,
          namespaces
        ) do
          request.write_xml(xml_markup)
        end
      end
    end

    attr_reader :username,
      :password,
      :request

    def namespaces
      Stellae::Xml::NAMESPACES
    end
  end
end
