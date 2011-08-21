require 'test_helper'

class ButtonsPartialTest < SharedViewTest

  test "happy path should render..." do
# A single session-buttons div:
    assert_select @ds, 1
# Various button divs:
    assert_select @ds.child(@d), 5
# Various button forms:
    assert_select @f, 5
    fb=@f.css_class 'button_to'
    assert_select fb, 5
# Most buttons open in the same tab...:
    assert_select fb.not(CssString.new.attribute 'target'), 4
# Except 'user pictures', which opens a new window:
    assert_single [(@d.css_class('user-item-index').child @f),'target'],
        '_blank', false
# Various buttons, which should...:
    functions   = %w[ edit show admin-item-index user-item-index destroy]
    values      = %w[ files problems admin-items user-items logout ]
    url_options = %w[ /edit /show /admin /user /destroy ]
    functions.zip(values,url_options).each do |f,v,u|
# Be single in their class:
      assert_select (s=(@d.css_class f)), 1, f
# Have the right class:
      assert_select s.child(fb), 1, f
# Be submit buttons:
      sn=s.descend(@i).not CssString.new.attribute 'name'
      assert_single [sn,'type' ], 'submit', false
# Show the right text on their face:
      assert_single [sn,'value'], v,        false
# Link to the right URL:
      assert_single [(s.child @f),'action'], u, false
    end
  end

#-------------
  private

  def setup
    render_layout
    @d = CssString.new 'div'
    @ds=@d.css_class 'session-buttons'
    @dd=@ds.descend @d
    @f,@i = %w[  form  input  ].map{|e| CssString.new e}
  end

end
