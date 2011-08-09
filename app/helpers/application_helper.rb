module ApplicationHelper

  def button(bt,c,a,co=:simplest,m=:get)
    s=content_tag 'div', :class => c do
      button_to bt, {:controller => co, :action => a}, :method => m
    end
    concat s
    nil
  end

end
