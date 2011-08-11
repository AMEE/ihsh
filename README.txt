== ihsh

ihsh is an HTTP shell written in Ruby that lets you interact with remote web servers
in a simple way. It includes XPath support for parsing result documents.

Licensed under the BSD 3-Clause license (See LICENSE.txt for details)

Authors: James Smith

Copyright: Copyright (c) 2011 AMEE UK Ltd

Homepage: http://github.com/AMEE/ihsh

== INSTALLATION

No installation currently - just run irb and require 'ihsh.rb' directly.

== REQUIREMENTS

 * nokogiri

== USAGE

result = get 'http://www.google.com'
result = get 'http://my.private.com', :username => 'foo', :password => 'bar'
result = get 'http://my.api.com', :accept => 'application/xml'
result = post 'http://my.api.com', :accept => 'application/xml', :body => 'foo=bar&baz=qux'

text = xpath(result, '//MyInterestingNode/text()').to_s