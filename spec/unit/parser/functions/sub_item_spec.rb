#! /usr/bin/env ruby -S rspec
require 'spec_helper'

describe "the sub_item function" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  $hash = { 'a' => { 'aa' => '1', 'aaa' => '2' }, 'b' => ['3','4'], 'c' => '5'}

  it "should exist" do
    Puppet::Parser::Functions.function("sub_item").should == "function_sub_item"
  end

  it "should raise a ParseError if there is less than 2 arguments" do
    lambda { scope.function_sub_item([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should return sub item from a hash" do

    expect = { 'aa' => '1', 'aaa' => '2' }

    result = scope.function_sub_item([$hash,'a'])
    result.should == expect
  end

  #it "should return array from hash" do
  #
  #  expect = ['3','4']
  #
  #  result = scope.function_sub_item([$hash,'b'])
  #  result.should == expect
  #end

  it "shoudl return string from hash" do

    expect = '5'
    result = scope.function_sub_item([$hash,'c'])
    result.should == expect
  end
end