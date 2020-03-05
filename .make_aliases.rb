#!/usr/bin/env ruby
current_alias_list = []
alias_file = File.absolute_path("/Users/guysbryant/.alias.sh")
puts "Collecting all current aliases from ~/.alias.sh"

open(alias_file, 'r'){|f| f.each{|line| current_alias_list << line}}

puts "Collecting all filenames from ~/.about"
about_contents = Dir["/Users/guysbryant/.about/*"]

puts "Creating aliases to cat file contents from ~/.about by using the filename plus p"
puts "    ex I have a file called git, gitp will display the contents of this file in my terminal"
about_contents.each do |file|
    file_name = file.gsub("/Users/guysbryant/.about/", "")
    if current_alias_list.include?("alias #{file_name}p='cat ~/.about/#{file_name}'\n")
        puts "Already have alias #{file_name}p "
    else
        open(alias_file, 'a'){|f| f.puts "alias #{file_name}p='cat ~/.about/#{file_name}'\n" }
        puts "    Added #{file_name}p "
    end
end
puts "You will need to manually source ~/.alias.sh or ~/.zshrc to have access to any new alias"
