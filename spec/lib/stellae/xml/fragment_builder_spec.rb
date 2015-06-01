require 'spec_helper'

describe Stellae::Xml::FragmentBuilder do
  let(:object) {
    double(
      'myobject',
      attribute_keys: [:attr1],
      root_name: 'myobject',
      get_attribute: nil,
      get_attribute_type: nil
    )
  }

  subject { described_class.new(object) }

  describe '#xml' do
    let(:xml) { subject.xml }

    it 'should report values' do
      expect(object).to receive(:get_attribute).
        with(:attr1).
        and_return('joe')

      expect(xml).to include('<a:attr1>joe</a:attr1>')
    end

    it 'should report nil for nil strings' do
      expect(object).to receive(:get_attribute_type).
        with(:attr1).
        and_return(:string)

      expect(xml).to include("<a:attr1 i:nil=\"true\"/>")
    end

    it 'should report 0.0 for nil decimals' do
      expect(object).to receive(:get_attribute).with(:attr1)
      expect(object).to receive(:get_attribute_type).
        with(:attr1).
        and_return(:decimal)

      expect(xml).to include("<a:attr1>0.0</a:attr1>")
    end

    it 'should report 0 for nil integers' do
      expect(object).to receive(:get_attribute).with(:attr1)
      expect(object).to receive(:get_attribute_type).
        with(:attr1).
        and_return(:integer)

      expect(xml).to include("<a:attr1>0</a:attr1>")
    end
  end
end
