require 'test_helper'

class PictureViewTest < SharedViewTest

  test "happy path should render..." do
# A styling suggestion for a list of all tags:
    include? DIV.css_class('tags').child DIV.css_class('tag')
# And...
# Shouldn't display a picture commit button:
    s = @dp.child(CssString.new(FORM).css_class('edit_picture'),INPUT).
        attribute(NAME, COMMIT).descend "\n" + (display NONE)
    s = s.gsub " \n", "\n"
    include? s
# Session buttons should be horizontal:
    s = DIV.css_class('session-buttons').child(DIV, FORM).css_class(
        'button_to').child(DIV).descend "\n" + @di
    s = s.gsub " \n", "\n"
    include? s
# Labels should be horizontal:
    s = DIV.css_class(LABEL).descend "\n" + @dib
    s = s.gsub " \n", "\n"
    include? s
# Include one style tag:
    assert_single [STYLE, CLASS], STYLE+'s', false
    assert_single [STYLE, TYPE], 'text/css', false
  end

#-------------
  private

  def assert_select_include? css, string
    assert_select css, (Regexp.new Regexp.escape string)
  end

  def display s
    CssString.new '{display: ' + s + '}'
  end

  def include? substring
    assert_select_include? STYLE.attribute(TYPE, 'text/css'), substring
  end

  def setup
    render_layout
    @di,@dib = %w[inline inline-block].map{|e| display e}
    @dp=DIV.css_class 'picture'
  end

end
