require 'test_helper'

class CssStringTest < ActiveSupport::TestCase

  test "+" do
    assert_equal 'ab', CssString.new('a')+'b'
  end

=begin
  test "qq" do
    assert_equal '', CssString.new('a').qq'b'
  end
=end

end
