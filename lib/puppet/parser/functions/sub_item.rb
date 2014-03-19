#
# sub_item.rb
#

module Puppet::Parser::Functions
  newfunction(:sub_item, :type => :rvalue, :doc => <<-EOS
When given a hash and a depth this function will return the sub hash at that depth

*Examples:*

  $hash = {
    'a' => {
      'aa' => '1',
      'aaa' => '2'
    },
    'b' => ['3','4'],
    'c' => '5'
  }

  The example:

    sub_hash($hash,'a')

  would return:

    {'aa' => '1', 'aaa' => '2'}

  The example:

     sub_hash($hash, 'b')

  would return:

     ['3','4']

  EOS

  ) do |arguments|

    raise(Puppet::ParseError, "sub_item(): Wrong number of arguments " +
        "given (#{arguments.size} for 2)") if arguments.size < 2

    hash = arguments[0]
    key = arguments[1]

    unless hash.is_a?(Hash)
      raise(Puppet::ParseError, 'sub_item(): Requires hash to work with')
    end

    result = ""

    hash.each do |k,v|
      if (k.eql?(key))
        result = v
      end
    end

    return result
  end
end
