require 'test_helper'

class CPartialTest < SharedViewTest

  test "happy path should render..." do
# A styling suggestion for a list of all tags:
    include? DIV.css_class('tags').child DIV.css_class('tag')
# And...
# Shouldn't display a picture commit button:
    s = @dp.child(CssString.new('form').css_class('edit_picture'),'input').
        attribute('name', 'commit').descend "\n" + (display 'none')
    s = s.gsub " \n", "\n"
    include? s
# Session buttons should be horizontal:
    s = DIV.css_class('session-buttons').child(DIV,'form').css_class('button_to').
        child(DIV).descend "\n" + @di
    s = s.gsub " \n", "\n"
    include? s
# Labels should be horizontal:
    s = DIV.css_class('label').descend "\n" + @dib
    s = s.gsub " \n", "\n"
    include? s
# Include one style tag:
    assert_single [@s,'class'], @s+'s', false
    assert_single [@s,'type' ], 'text/css', false
  end

#-------------
  private

  def assert_select_include?(css, string)
    assert_select css, (Regexp.new Regexp.escape string)
  end

  def display(s)
    CssString.new '{display: ' + s + '}'
  end

  def include?(substring)
    assert_select_include? @s.attribute('type','text/css'), substring
  end

  def setup
    render_layout
    @d,@s = %w[div style].map{|e| CssString.new e}
    @di,@dib = %w[inline inline-block].map{|e| display e}
    @dp=@d.css_class 'picture'
  end

end
