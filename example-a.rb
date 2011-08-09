#@+leo-ver=5-thin
#@+node:georgesawyer.20110806134147.1247: * @file example-a.rb
require 'test_helper'

class HtmlTest < ActionController::TestCase

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
#@-leo
