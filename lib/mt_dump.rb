require 'rubygems'
require 'active_support'
require 'csv'

class MTDump
  attr_accessor :entries, :src

  def initialize(file = nil)
    @entries = []
    @src = open(file, "r") {|f| f.read } if file
  end

  def parse
    @src.split("\n\n--------\n").each do |s|
      entry = {}

      s.split("\n-----\n").each_with_index do |p, i|
        case i
        when 0
          p.gsub!("\n\n", "\n")
          p.split("\n").each do |l|
            name, value = l.split(": ")
            name = name.downcase.gsub(" ", "_").strip
            if name == 'date'
              value = Time.parse(value).to_s(:db)
            end
            entry[name] = value
          end
        when 1
          entry['body'] = p.gsub(/^BODY:*\n/, "")
        when 2
          entry['extended_body'] = p.gsub(/^EXTENDED BODY:*\n/, "")
        end
      end
      @entries << entry
    end
    self
  end

  def to_csv(file)
    CSV.open(file, 'w') do |writer|
#      writer << ['id', 'permalink']
      writer << ['id', 'title', 'body', 'created_at', 'updated_at']
      entries.sort_by {|a| a['id'].to_i }.each do |e|
        if e['status'] == 'Publish'
#          writer << [e[:id], e[:permalink]]
          writer << [e['id'], e['title'], e['body']+e['extended_body'], e['date'], e['date']]
        end
      end
    end
  end
end
