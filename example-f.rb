#@+leo-ver=5-thin
#@+node:georgesawyer.20110806134147.1263: * @file example-f.rb
require 'test_helper'

class ASessionsPartialTest < ActionController::TestCase

  test "happy path should render the right..." do
    happy_path
# Partial, once:
    assert_partial
# Div class:
    assert_select @dg, 1
# Which should contain the right...:
# Message, once:
    assert_select @gm, 1
    assert_single @dm, @group.message
# List, once:
    assert_select @gl, 1
# Which should contain the right...:
# Number of pictures:
    assert_select @ga, 2
    assert_select @da, 2
    assert_select @a, 2
# Picture filenames, each once:
# And only the pictures:
    assert_select (@dl.descend '*'), 4
    assert_select (@dl.child 'a'), 2
    assert_select (@dl.child(@d).css_class 'picture-errors'), 2
    assert_single @dl, (@group.list.map(&:filename).map{|e| e+'.'}.join "\n")
  end

  def setup
    @group=Struct.new(:list,:message).new  %w[abc def], 'something'
    @special='(none)'
    @a,@d = %w[a div].map{|e| CssString.new e}
    @dg,@dl,@dm = %w[group  list  message].map{|e| @d.css_class 'review-'+e}
    @gl,@gm=[@dl,@dm].map{|e| @dg.child e}
    @da,@ga=[@dl,@gl].map{|e| e.child @a}
  end
end
#@-leo
