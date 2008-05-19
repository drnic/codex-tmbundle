require File.dirname(__FILE__) + "/test_helper"
require "convert_to_inlinecode"

class TestConvertToInlinecode < Test::Unit::TestCase
  def test_blank_line_should_return_blank_line
    expected = <<-EOS
    EOS
    assert_equal(expected, ConvertToInlinecode.run(""))
  end

  def test_non_code_line_should_return_blank_line
    expected = <<-EOS
    EOS
    assert_equal(expected, ConvertToInlinecode.run("something else"))
  end

  def test_file_insert
    expected = <<-EOS
:inlinecode
class Dog
end
:endinlinecode
    EOS
    assert_equal(expected, ConvertToInlinecode.run(":code code/dog.rb"))
  end
end