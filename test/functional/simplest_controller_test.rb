require 'test_helper'

class SimplestControllerTest < ActionController::TestCase

  include CssStringConstants

  test "scripts div..." do
# Should include certain script tags in order:
    assert_select @dss, 6
  end

  test "happy path should render..." do
# One scripts div which should include six...:
    assert_select @ds, 1 do
# Tags:
      assert_select @ds.descend('*'), 6
# Script tags:
      assert_select @dss, 6
      assert_select @dss.attribute('type','text/javascript'), 6
    end
# Only those script tags:
    assert_select @ds, ''
    assert_select @ds.descend('*').not('script'), false
  end

#-------------
  private

  def setup
    @ds=DIV.css_class 'scripts'
    @dss=@ds.descend 'script'
    @dsb=DIV.css_class 'session-buttons'
    @dd=@dsb.descend DIV
    get :index
  end

end
