# coding: utf-8
module Wingalingding
  
  class Char
    
    attr_reader :description, :char, :hex, :code
      
    def self.find(description)
      Scraper.
      character_map.
      find_all{|char| char =~ Regexp.new(description, "xig") }.
      map{|c| self.new(c)}
    end
    
    def initialize(line)
      @stripped = line.strip.split(/\t/)
      @description = @stripped[1]
      @char = @stripped[0]
      @hex = @stripped[2]
      @code = @description.match(/\(U\+[a-zA-Z0-9]+\)/).to_s
    end
    
    def inspect
      "#{char} -> #{description}"
    end
    
    def self.display(description)
      chars = self.find(description)
      desc_max = chars.map{|c| c.description.size }.max
      op = ""
      op = "┏━━━━━┳━"
      desc_max.times{ op << "━"}
      op << "━━┓\n"
      chars.each do |c|
        op << "┃  #{c.char}  ┃  #{c.description.ljust(desc_max)} ┃\n"
      end
      op << "┗━━━━━┻━"
      desc_max.times{ op << "━"}
      op << "━━┛"
      return op
    end

    
  end
  
end