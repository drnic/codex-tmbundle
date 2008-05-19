#!/usr/bin/env ruby
require File.dirname(__FILE__) + "/../lib/convert_to_inlinecode"

puts ConvertToInlinecode.run(ENV['TM_CURRENT_LINE'])