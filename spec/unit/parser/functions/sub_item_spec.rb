#! /usr/bin/env ruby -S rspec
require 'spec_helper'

describe "the sub_item function" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  hash = { 'a' => { 'aa' => '1', 'aaa' => '2' }, 'b' => ['3','4'], 'c' => '5'}

  it "should exist" do
    Puppet::Parser::Functions.function("sub_item").should == "function_sub_item"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { scope.function_sub_item([]) }.should( raise_error(Puppet::ParseError))
  end

  context "return hash" do
    let(:expectation) {
      { 'aa' => '1', 'aaa' => '2' }
    }

    it "should return sub item from a hash" do
      result = scope.function_sub_item([hash,'a'])
      result.should be_a(Hash)
      result.should == expectation
    end
  end

  context "return array" do
    let(:expectation) {
      ['3','4']
    }

    it "should return array from hash" do
      result = scope.function_sub_item([hash,'b'])
      result.should be_a(Array)
      result.should == expectation
    end
  end

  context "return string" do
    let(:expectation) {
      '5'
    }

    it "should return string from hash" do
      result = scope.function_sub_item([hash,'c'])
      result.should be_a(String)
      result.should == expectation
    end
  end

end