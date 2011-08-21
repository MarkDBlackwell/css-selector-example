require 'test_helper'

class HtmlViewTest < SharedViewTest

  test "..." do
# Html body section should include exactly one div, for each of...
# Messages, buttons and action content:
    %w[ messages  session-buttons  action-content ].map do |e|
      assert_descend BODY, (DIV.css_class e)
    end
  end

#-------------
  private

  def setup
    render_layout
  end

end
