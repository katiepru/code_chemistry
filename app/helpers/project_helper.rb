module ProjectHelper
  def detect_tabs_style(owner, repo)
    tabs_used = owner+"/"+repo
    Octokit.tree(owner+"/"+repo,"HEAD")['tree'].each do |hash|
      if hash and hash['file']
        tabs_used = "1"
        unless hash['file'].downcase == "readme" || hash['file'].downcase == "readme.md"
          parse_file = open("https://raw.github.com/"+owner+"/"+repo+"/master/"+hash['file'])
          check_next=false
          parse_file.each_line do |line|
            curr_line = line
            if not prev_line
              prev_line = curr_line
            else
              if curr_line[/\A */].size > prev_line[/\A */].size
                tabs_used = (curr_line[/\A */].size - prev_line[/\A */].size).to_s
              end
            end
          end
        end
      end
    end
    return tabs_used
  end
end
