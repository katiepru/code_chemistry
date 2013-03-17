require 'open-uri'
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def test_pull_request diff_url
    ret_number = 13
    diff_file = open(diff_url)
    diff_file.each_line do |line|
      curr_line = line
      if curr_line[0] == '+' && curr_line[1] == ' '
        ret_number = curr_line[1..-1][/\A */].size
        break
      end
    end
    
    return ret_number
  end
end
