require 'test_helper'

class CssStringTest < ActiveSupport::TestCase

  test "+" do
    assert_equal 'a + b', CssString.new('a')+'b'
  end

end
