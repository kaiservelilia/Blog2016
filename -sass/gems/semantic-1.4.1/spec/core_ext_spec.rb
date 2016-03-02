require 'spec_helper'
require 'semantic/core_ext'

describe 'Core Extensions' do
  context "String#to_version" do
    before(:each) do
      @test_versions = [
        '1.0.0',
        '12.45.182',
        '0.0.1-pre.1',
        '1.0.1-pre.5+build.123.5',
        '1.1.1+123',
        '0.0.0+hello',
        '1.2.3-1'
      ]

      @bad_versions = [
        'a.b.c',
        '1.a.3',
        'a.3.4',
        '5.2.a',
        'pre3-1.5.3'
      ]
    end

    it "extends String with a #to_version method" do
      String.new.should respond_to(:to_version)
    end

    it "converts the String into a Version object" do
      @test_versions.each do |v|
        expect { v.to_version }.to_not raise_error()
        v.to_version.should be_a(Semantic::Version)
      end
    end

    it "raises an error on invalid strings" do
      @bad_versions.each do |v|
        expect { v.to_version }.to raise_error()
      end
    end
  end
end
