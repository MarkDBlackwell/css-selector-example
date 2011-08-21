require 'test_helper'

class ButtonsViewTest < SharedViewTest

  test "happy path should render..." do
# A single session-buttons div:
    assert_select @ds, 1
# Various button divs:
    assert_select @ds.child(DIV), 5
# Various button forms:
    assert_select FORM, 5
    fb=FORM.css_class 'button_to'
    assert_select fb, 5
# Most buttons open in the same tab...:
    assert_select fb.not(CssString.new.attribute TARGET), 4
# Except 'user pictures', which opens a new window:
    assert_single [(DIV.css_class('user-item-index').child FORM), TARGET],
        '_blank', false
# Various buttons, which should...:
    functions   = %w[ edit show admin-item-index user-item-index destroy]
    values      = %w[ files problems admin-items user-items logout ]
    url_options = %w[ /edit /show /admin /user /destroy ]
    functions.zip(values,url_options).each do |f,v,u|
# Be single in their class:
      s=DIV.css_class f
      assert_select s, 1, f
# Have the right class:
      assert_select s.child(fb), 1, f
# Be submit buttons:
      sn=s.descend(INPUT).not CssString.new.attribute NAME
      assert_single [sn, TYPE], SUBMIT, false
# Show the right text on their face:
      assert_single [sn, VALUE], v, false
# Link to the right URL:
      assert_single [(s.child FORM), ACTION], u, false
    end
  end

#-------------
  private

  def setup
    render_layout
    @ds=DIV.css_class 'session-buttons'
    @dd=@ds.descend DIV
  end

end
