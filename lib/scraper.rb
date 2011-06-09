require 'nokogiri'
require 'open-uri'
require 'fileutils'

module Wingalingding
  
  class Scraper

    SOURCE = "http://www.fileformat.info/info/charset/UTF-8/list.htm?start=%s"
    CSS_SELECTOR = "table.list tr"
    CHARACTER_TABLE_DIRECTORY =  File.join( File.dirname(__FILE__), "../charsets")
    COMPLETE_CHARACTER_TABLE="utf8.txt"
    OUTPUT_FILENAME = File.join(CHARACTER_TABLE_DIRECTORY, "chars.txt")
    LOG = File.join( File.dirname(__FILE__), "../log/scrape.log")
    KEEP_PARTIAL_FILES=true
    
   
    def initialize(start=0)
      @start = start
      @next  = @start
      FileUtils.mkdir_p CHARACTER_TABLE_DIRECTORY
      @output_file = File.open(OUTPUT_FILENAME,"w+")
    end
    
    def log(message)
      puts message
      `echo '[#{Time.now.to_s}] #{message}' >> #{LOG}`
    end
    
    def url
      SOURCE % @start.to_i.to_s
    end
    
    def character_files
      Dir.entries(CHARACTER_TABLE_DIRECTORY).map{|f| f =~ /^chars.*[0-9]+.*\.txt$/ ? File.join(CHARACTER_TABLE_DIRECTORY,f) : nil}.compact
    end

    def supposed_leap(start=nil)
      start ||= @start
      File.readlines(associated_file(start)).size
    end
    
    def doc
      log "reading doc #{url}"
      Nokogiri::HTML(open(url))
    end
    
    def character_table
      doc.css(CSS_SELECTOR).map{|node| node.css("td").map(&:content).join("\t") }
    end
    
    def collect_characters(character_list)
      @charset = character_list.reject{|line| line =~ /^More\.+$|^\s*$/i }
      log "character list: #{@charset.size} - #{@charset[0]}"
      @next   += @charset.size
      log "new range is #{@start} - #{@next}"
      @content = @charset.join("\n")
    end
    
    def partial_filename(start=nil, last=nil)
      start ||= @start
      last ||= @last
      File.join(CHARACTER_TABLE_DIRECTORY, "chars_#{"%05i" % start.to_i}-#{"%05i" % last.to_i}.txt")
    end
    
    def record_characters
      log "Creating new file"
      f = File.open(partial_filename(@start, @next),"w+");f.puts @content;f.close
    end
    
    def already_recorded
      character_files.select{|file| file =~ /chars_#{"%05i" % @start.to_i}\-[0-9]+\.txt$/ }.first
    end
    
    
    def scrape
      log "Starting scrape"
      while (@next == 0 ) || (@next > 0 && @charset.size > 0) do
        if !already_recorded.nil?
          log "Already recorded (File exists: #{already_recorded})"
          collect_characters File.read(already_recorded).split("\n")
        else 
          collect_characters character_table
          record_characters
        end
        @start   = @next
      end
      @output_file.close
    end
    
    def partials
      Dir.entries(CHARACTER_TABLE_DIRECTORY).select{|f| f =~ /^chars_/ }.map{|f| File.join(CHARACTER_TABLE_DIRECTORY, f) }
    end
    
    def delete_partials
      log "Deleting partials"
      partials.each{|f| File.delete f }
    end
    
    def self.character_map
      File.readlines( File.join(CHARACTER_TABLE_DIRECTORY,COMPLETE_CHARACTER_TABLE) )
    end
    
    
    def cleanup
      log "Cleaning up files"
      final_charset_filename = File.join(CHARACTER_TABLE_DIRECTORY,COMPLETE_CHARACTER_TABLE)
      final_charset = File.open(final_charset_filename, "w+" )
      Dir.entries(CHARACTER_TABLE_DIRECTORY).select{|f| f =~ /^chars_/ }.each do |f|
        segment =  File.join(CHARACTER_TABLE_DIRECTORY, f)
        final_charset.puts File.read(segment)
      end
      final_charset.close
      delete_partials unless KEEP_PARTIAL_FILES
      entries = File.read(final_charset_filename).split(/\n|\r/).map{|l| l.strip.gsub('\n','')}.reject{|line| line.length == 0 || line =~ /^(\n|\r)+$/ }.uniq
      final_charset = File.open(final_charset_filename, "w+" )
      final_charset.puts entries.join("\n")
      final_charset.close
      log "Final character map contains:" +  File.readlines(final_charset_filename).size.to_s + " files"
    end
    
    def retrieve
      scrape
      cleanup
    end

  end
  
end
