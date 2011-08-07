#@+leo-ver=5-thin
#@+node:georgesawyer.20110806134147.1257: * @file example-c.rb
require 'test_helper'

class CPartialTest < ActionController::TestCase

  test "whether editing..." do
    f='something'
    s=@fd.css_class f
    si=s.child 'input'
    assert_select si, false
# Should render a single, right value:
    assert_single s, @field
    assert_select si, false
# Should render a single, right value in an editing box:
    assert_single [si,'name'], "picture[#{f}]"
    assert_single [si,'type'], 'text'
    assert_single [si,'value'], @field
  end

  test "happy path should render..." do
# A styling suggestion for a list of all tags:
    include? @d.css_class('tags').child @d.css_class('tag')
# And...
# Shouldn't display a picture commit button:
    s = @dp.child(CssString.new('form').css_class('edit_picture'),'input').
        attribute('name', 'commit').descend "\n" + (display 'none')
    s = s.gsub " \n", "\n"
    include? s
# Session buttons should be horizontal:
    s = @d.css_class('session-buttons').child(@d,'form').css_class('button_to').
        child(@d).descend "\n" + @di
    s = s.gsub " \n", "\n"
    include? s
# Labels should be horizontal:
    s = @d.css_class('label').descend "\n" + @dib
    s = s.gsub " \n", "\n"
    include? s
# Include one style tag:
    assert_single [@s,'class'], @s+'s'
    assert_single [@s,'type' ], 'text/css'
  end
end
#@-leo
