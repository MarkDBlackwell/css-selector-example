require 'test_helper'

class BSessionsPartialTest < ActionView::TestCase

  test "happy path should render..." do
# A single...:
# Approval div:
    assert_select @da, 1, @da
# Submit button:
    assert_select @is, 1, @b
# Form...:
    assert_select @da.child(@f), 1, @f
# Which should...:
# Include a submit button...:
# On which should be the appropriate text:
    assert_single [(@f.child @is), @v], @group.message, false
# Include a hidden input...:
    %w[name id].each{|e| assert_single [(@f.child @ih), e], @a+'_group', false}
  end

  def setup
    @group=Struct.new(:list,:message).new  %w[abc def], 'something'
    render_partial 'sessions/approval_group', :approval_group => @group
    @a,@b,@d,@f,@i,@m,@v = %w[
            approval  button  div  form  input  method  value
    ].map{|e| CssString.new e}
    @ih,@is = %w[ hidden  submit ].map{|e| @i.attribute 'type', e}
    @da=@d.css_class 'approve'
  end
end
