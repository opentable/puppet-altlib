# Puppet Alternative Library #

[![Build
Status](https://secure.travis-ci.org/opentable/puppet-altlib.png)](https://secure.travis-ci.org/opentable/puppet-altlib.png)

This module provides an additional set of resources that are not found in the Puppet Standard Library. This module will include the following additions to Puppet:

* Functions
* Facts

This module is provided by OpenTable. The modules that OpenTable write and distributes may make extensive use of this library.

# Functions #

sub_item
---
Takes a hash as a first argument and a key as the second argument. Will iterate through the hash until it finds the key and then return the corisponding value.

Example:

    $hash = {
      'a' => {
        'aa' => '1',
        'aaa' => '2'
      },
      'b' => ['3','4'],
      'c' => '5'
    }

    sub_hash($hash,'a')

Would return: {'aa' => '1', 'aaa' => '2'}

- *Type*: rvalue

replace_hash
---

Example:

    $original_hash = {
      'test' => {
        'ensure' => 'present',
        'groups' => ['sudo']
      }
    }

    $modifier = { 'groups' => ['wheel'] }

    replace_hash($orginal_hash, $modifier)

Would return: { 'test' => { 'ensure' => 'present', 'groups' => ['wheel'] } }

- *Type*: rvalue

# Facts #

agent_ssldir
---
Returns the directory where SSL certificates are kept

agent_config
---
Returns the configuration file for the current puppet application.

agent_rundir
---
Returns the directory where Puppet PID files are kept