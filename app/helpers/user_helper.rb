module UserHelper

  def calc_ratio(langs_hash, lang)
    total_lines = 0
	  lang_lines = 0
	  langs_hash.each do |l|
	    total += l[1].to_i
	    if l[0] == lang
         lang_lines = l[1].to_i
	    end
	  end
		return(((lang_lines*100)/total_lines).to_s)+"%"
  end
end
