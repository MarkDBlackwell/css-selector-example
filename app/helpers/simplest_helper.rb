module SimplestHelper

  def alltags
    concat( render :partial => 'simplest/all_tags' )
    nil
  end

  def gallery
    concat( render :partial => 'simplest/gallery' )
    nil
  end

end
