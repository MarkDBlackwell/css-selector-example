require 'test_helper'

class ScriptsApplicationPartialTest < ActionView::TestCase

  test "scripts div..." do
# Should include certain script tags in order:
    assert_select @dss, 6

    %w[ prototype effects dragdrop controls rails application].
        each_with_index do |e,i|
      r=static_asset_matcher base_uri.join *['javascripts',"#{e}.js"]
      assert_single [@ds + " :nth-child(#{i+1})", 'src'], r, false
    end
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

  def setup
    render_partial 'application/scripts'
    @d=CssString.new 'div'
    @ds=@d.css_class 'scripts'
    @dss=@ds.descend 'script'
  end
end
