require 'open-uri'
module ProjectHelper
  def detect_tabs_style(owner, repo)
    return 4
    #Octokit.tree(owner+"/"+repo,"HEAD")['tree'].each do |hash|
      #if hash and hash['path']
        #unless hash['path'].downcase == "readme" || hash['path'].downcase == "readme.md"
          #parse_file = open("https://raw.github.com/"+owner+"/"+repo+"/master/"+hash['path'])
          #prev_line = nil
          #parse_file.each_line do |line|
            #curr_line = line
            #if prev_line.nil?
              #prev_line = curr_line
            #else
              #if curr_line[/\A */].size > prev_line[/\A */].size
                #tabs_used = (curr_line[/\A */].size - prev_line[/\A */].size).to_s
                #return tabs_used
              #end
            #end
          #end
        #end
      #end
      #return tabs_used
    #end
  end
end
