ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require File.expand_path('../../test/unit/views/_shared.rb', __FILE__)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

#-------------
  private

  def see_output(s=nil)
    a = %w[rendered response].map{|e|(!respond_to? e) ? nil : (send e)}
    a.push(a.pop.body) if a.last
    (a.unshift s).compact!
    assert_present a, 'nothing defined'
    f=Rails.root.join('out/see_output').open 'w'
    f.print a.first
    f.close
  end
end
