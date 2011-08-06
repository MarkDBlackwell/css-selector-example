
module CssSelector

  def assert_descend(a,b)
    assert_select b, 1
    assert_select a.descend(b), 1
  end

  def assert_single(selector,value,also_attribute_alone=true)
    if (was_array=selector.kind_of? Array)
      raise unless 2==selector.length
      s,a=*selector
    else
      s=selector
    end
    s||=''
    s=CssString.new(s) unless s.kind_of? CssString
    unless was_array
      assert_select s, 1, s+' count'
      assert_select s, value
    else
      assert_select s, 1 unless s.blank?
      (! also_attribute_alone ? [s] : [s, CssString.new]).each do |e|
        assert_select e.attribute(a), 1
        assert_select e.attribute(a,'?'), value
      end
    end
  end

end
