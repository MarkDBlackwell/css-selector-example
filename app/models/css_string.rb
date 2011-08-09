#@+leo-ver=5-thin
#@+node:georgesawyer.20110806135445.1333: * @file css_string.rb
# CSS Selector String
class CssString < String

  def +(      value) CssString.new   [self, value].to_s       end
  def adjacent(  *a) CssString.new a.unshift(self).join ' + ' end
  def child(     *a) CssString.new a.unshift(self).join ' > ' end
  def css_class( *a) CssString.new a.unshift(self).join  '.'  end
  def css_id(    *a) CssString.new a.unshift(self).join  '#'  end
  def descend(   *a) CssString.new a.unshift(self).join  ' '  end
  def first(     *a) self.child(*a) + ':first-child'          end
  def last(      *a) self.child(*a) +  ':last-child'          end
  def not(       *a) s=':not('; self+s+(a.join ')'+s)  +')'   end

  def attribute *a
    r = self.clone
    n_full_pairs, n_unpaired = a.length.divmod 2
    (1..n_full_pairs + n_unpaired).times do |i|
      r << '[' + a.shift
      r << '=' + a.shift unless i > n_full_pairs
      r << ']'
    end
    CssString.new r
  end

end
#@-leo
