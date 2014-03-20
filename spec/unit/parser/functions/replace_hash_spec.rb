#! /usr/bin/env ruby -S rspec
require 'spec_helper'

describe "the replace_hash function" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }
  let(:expectations) {
    { 'a' => { 'aa' => '1', 'aaa' => '2' },
      'b' => ['x','x'],
      'c' => '5'
    }
  }

  hash = {
      'a' => {
          'aa' => '1',
          'aaa' => '2'
      },
      'b' => ['3','4'],
      'c' => '5'
  }

  it "should exist" do
    Puppet::Parser::Functions.function("replace_hash").should == "function_replace_hash"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { scope.function_sub_item([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should return hash with the new data" do
    result = scope.function_replace_hash([hash,{'b' => ['x','x']}])
    result.should == expectations
  end
end