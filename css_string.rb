  class CssString < String
    def adjacent( *a) CssString.new a.unshift(self).join ' + ' end
    def child(    *a) CssString.new a.unshift(self).join ' > ' end
    def css_class(*a) CssString.new a.unshift(self).join  '.'  end
    def css_id(   *a) CssString.new a.unshift(self).join  '#'  end
    def descend(  *a) CssString.new a.unshift(self).join  ' '  end

    def first(*a) self.child(*a) + ':first-child' end
    def last( *a) self.child(*a) +  ':last-child' end

    def not(*a)  s=':not('; self + s + a.join( ')'+s) + ')' end
    def +(value) CssString.new [self,value].to_s end

    def attribute(*a)
      odd_p=pairs=(a.length+1)/2
      odd_p -= a.length%2
      r=self.clone
      pairs.times do |i|
        r << '[' + a.shift
        r << '=' + a.shift if i < odd_p
        r << ']'
      end
      CssString.new r
    end

  end

end
