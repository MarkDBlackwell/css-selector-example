require 'test_helper'

class HtmlTest < ActionController::TestCase

  tests ApplicationController

  test "..." do
# Html body section should include exactly...
# One message div:
    assert_descend @b, @dm
# One buttons div:
    assert_descend @b, @dsb
# One action content div:
    assert_descend @b, @dac
  end

  def setup(*args)
    @b = CssString.new 'body'
    d  = CssString.new 'div'
    @dm,@dsb,@dac = %w[  messages  session-buttons  action-content
        ].map{|e| d.css_class e}
  end
end
