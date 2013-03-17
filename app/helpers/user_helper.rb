module UserHelper

  def lang_ratio(lang_hash, lang)
    total_lines = 0
	  lang_lines = 0
	  lang_hash.each do |l|
	  total_lines += l[1].to_i
	    if l[0] == lang
          lang_lines = l[1].to_i
	    end
	  end
	  total = (lang_lines*100)/total_lines
	  if total == 0
      return "<1%"
    else
	    return total.to_s+"%"
    end
  end
end
