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
      xml_markup.user(
        'xmlns:a' => 'http://schemas.datacontract.org/2004/07/',
        'xmlns:i' => 'http://www.w3.org/2001/XMLSchema-instance'
      ) do |u|
        u.a :user_name, username
        u.a :user_password, password
      end
    end

    def add_request_element(xml_markup)
      if request
        xml_markup.tag!(
          request.root_tag_name,
          {
            'xmlns:a' => 'http://schemas.datacontract.org/2004/07/',
            'xmlns:i' => 'http://www.w3.org/2001/XMLSchema-instance'
          }
        ) do
        end
      end
    end

    attr_reader :username,
      :password,
      :request
  end
end
