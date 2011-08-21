class SharedViewTest < ActionView::TestCase
  include CssSelector
  include CssStringConstants

  private

  def base_uri
    Pathname '/' # For example, '/gallery'.
  end

  def render_layout
## To render locals:
##    @controller.instance_variable_set :@variable, value
# NOTE: at least in Rails 3.0.9, Rails.public_path is a string, not a pathname.
# Automatically appends '.html.erb':
    render :file => (Rails.root.join *%w[public app])
  end

  def static_asset_matcher s
    e=Regexp.escape base_uri.join s
    Regexp.new %r"\A#{e}\?\d*\z"
  end

end
