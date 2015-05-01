require 'spec_helper'

describe Stellae::Xml::FragmentBuilder do
  describe 'subclasses' do
    subject do
      class TestClass < described_class
        string :b
        string :a

        decimal :z
        decimal :y
      end

      TestClass
    end

    describe "::alphabetized_keys" do
      it 'should alphabetize the keys' do
        expect(subject.alphabetized_keys).to eq([:a, :b, :y, :z])
      end
    end

    let(:instance) {
      subject.new(
        a: 'hello',
        y: 123
      )
    }

    describe '#xml' do
      let(:xml) { instance.xml }

      it 'should report values' do
        expect(xml).to include("<a:a>hello</a:a>")
      end

      it 'should report nil for nil strings' do
        expect(xml).to include("<a:b i:nil=\"true\"/>")
      end

      it 'should report 0 for nil decimals' do
        expect(xml).to include("<a:z>0</a:z>")
      end

      it 'should call ::alphabetized_keys' do
        expect(subject).to receive(:alphabetized_keys).and_return([:a, :b, :y, :z])
        xml
      end
    end
  end
end
