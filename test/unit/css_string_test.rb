require 'test_helper'

class CssStringTest < ActiveSupport::TestCase

  test "+" do
    run_joined '', big.map{|e| CssString.new('v').+(*e)}
    run_joined '', big.map{|e| CssString.new('v') + e}
  end

  test "adjacent" do
    run_joined ' + ', big.map{|e| CssString.new('v').adjacent *e}
    run_joined ' + ', big.map{|e| CssString.new('v').adjacent  e}
  end

  test "child" do
    run_joined ' > ', big.map{|e| CssString.new('v').child *e}
    run_joined ' > ', big.map{|e| CssString.new('v').child  e}
  end

  test "css_class" do
    run_joined '.', big.map{|e| CssString.new('v').css_class *e}
    run_joined '.', big.map{|e| CssString.new('v').css_class  e}
  end

  test "css_id" do
    run_joined '#', big.map{|e| CssString.new('v').css_id *e}
    run_joined '#', big.map{|e| CssString.new('v').css_id  e}
  end

  test "descend" do
    run_joined ' ', big.map{|e| CssString.new('v').descend *e}
    run_joined ' ', big.map{|e| CssString.new('v').descend  e}
  end

  test "first" do
    s = ':first-child'
    run_joined ' > ', big.map{|e| CssString.new('v').first *e}, s
    run_joined ' > ', big.map{|e| CssString.new('v').first  e}, s
  end

  test "last" do
    s = ':last-child'
    run_joined ' > ', big.map{|e| CssString.new('v').last *e}, s
    run_joined ' > ', big.map{|e| CssString.new('v').last  e}, s
  end

  test "not" do
    assert_equal 'v',                      (CssString.new('v').not [   ])
    assert_equal 'v',                      (CssString.new('v').not  ''  )
    assert_equal 'v',                      (CssString.new('v').not ['' ])
    assert_equal 'v:not(a)',               (CssString.new('v').not ['a'])
    assert_equal 'v:not(a)',               (CssString.new('v').not  'a' )
    assert_equal 'v:not(a):not(b)',        (CssString.new('v').not  %w[a b])
    assert_equal 'v:not(a):not(b)',        (CssString.new('v').not *%w[a b])
    assert_equal 'v:not(a):not(b):not(c)', (CssString.new('v').not  %w[a b c])
    assert_equal 'v:not(a):not(b):not(c)', (CssString.new('v').not *%w[a b c])
  end

#-------------
  private

  def args
    (0...number_of_arguments).map{|i|(?a + i).to_s}
  end

  def big
    sliding_take 0, args
  end

  def bigger
    sliding_take 1, (args.unshift 'v')
  end

  def run_joined joiner, objects, append=''
    bigger.map{|e|(e.join joiner).concat append}.zip(objects).each do |s,o|
# The result...
# Should be a CssString:
      flunk "#{o} not CssString" unless o.kind_of? CssString
# Should be convertable to a string equal to the comparer:
      assert_equal s, o
    end
  end

  def number_of_arguments
    4
  end

  def sliding_take first, a
    (first...first + number_of_arguments).map{|n| a.take n}
  end

end
