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

  let(:child_object) {
    double(
      'child-object',
      root_name: 'child-object',
      attribute_keys: [:child_attr1]
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

    let(:collection) { [child_object, child_object] }

    it 'should dig into collections' do
      expect(object).to receive(:get_attribute).
        with(:attr1).
        exactly(1).
        and_return(collection)

      expect(object).to receive(:get_attribute_type).
        with(:attr1).
        exactly(2).
        and_return(:collection)

      expect(child_object).to receive(:get_attribute).
        with(:child_attr1).
        exactly(2).
        and_return("hello")

      expect(child_object).to receive(:get_attribute_type).
        with(:child_attr1).
        exactly(4).
        and_return(:string)

      child_xml = '<a:child-object><a:child_attr1>hello</a:child_attr1></a:child-object>'
      expect(xml).to include("<a:attr1>#{child_xml * collection.length}</a:attr1>")
    end
  end
end
