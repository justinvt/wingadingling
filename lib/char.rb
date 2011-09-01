# coding: utf-8
module Wingalingding
  
  class Char
    
    attr_accessor :description, :char, :hex, :code
    
    # Truncate any character descriptions exceeding this length
    MAX_DESCRIPTION_LENGTH = 90
      
    def self.find(description)
      Scraper.
        character_map.
        find_all{|char| char =~ Regexp.new(description, "xig") }.
        map{|c| self.new(c)}
    end
    
    def initialize(line)
      @stripped = line.strip.split(/\t/)
      @description = @stripped[1][0..MAX_DESCRIPTION_LENGTH]
      @char = @stripped[0]
      @hex = @stripped[2]
      @code = @description.match(/\(U\+[a-zA-Z0-9]+\)/).to_s
    end
    
    def inspect
      "#{char} -> #{description}"
    end
    
    def self.display(description)
      chars = self.find(description)
      longest_description_length = chars.map{|c| c.description.size }.max
      table = "┏━━━━━┳━" + ("━" * longest_description_length) + "━━┓\n"
      chars.each{|c| table << "┃  #{c.char}  ┃  #{c.description.ljust(longest_description_length)} ┃\n" } 
      return table + "┗━━━━━┻━" + ( "━" * longest_description_length )  + "━━┛"
    end
    
  end
  
end