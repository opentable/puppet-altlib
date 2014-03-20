#
# replace_hash.rb
#

module Puppet::Parser::Functions

  newfunction(:replace_hash, :type => :rvalue, :doc => <<-EOS
This function searches through a hash, replaces the first occurrence with the given hash

*Examples:*

  $original_hash = {
    'lbennett' => {
      'ensure' => 'present',
      'groups' => ['sudo']
    }
  }

  $modifier = { 'groups' => ['wheel'] }

  $new_hash = {
    'lbennett' => {
      'ensure' => 'present',
      'groups' => ['wheel']
    }
  }

  EOS

  ) do |arguments|

    raise(Puppet::ParseError, "sub_item(): Wrong number of arguments " +
        "given (#{arguments.size} for 2)") if arguments.size < 2

    hash = arguments[0]
    modifier = arguments[1]

    unless hash.is_a?(Hash)
      raise(Puppet::ParseError, 'replace_hash(): Requires hash to work with')
    end

    unless modifier.is_a?(Hash)
      raise(Puppet::ParseError, 'replace_hash(): Requires a hash modifier')
    end


    result = {}
    replace_hash = Proc.new do |hash1,hash2|
      hash1.each do |ok, ov|
        hash2.each do |mk,mv|
          if(mk.eql?(ok))
            hash1[mk] = mv
          else
            if(ov.is_a?(Hash))
              result = replace_hash.call(ov, hash2)
            end
          end
        end
      end
      result = hash1
    end

    result = replace_hash.call(hash,modifier)

    return result
  end
end
