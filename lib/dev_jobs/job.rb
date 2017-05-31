require 'pry'

class DevJobs::Job

  attr_accessor :title, :date, :url

  @@all = []

  def self.new_from_scraper(j)
    self.new(
    j.css("h2").css("a").text.strip,
    j.css("h2").css("a").attr("href").text.strip,
    j.css("p").css(".-posted-date").text.strip,
    # j.css(".-name").text.strip,
    # j.css(".-location").text.strip
    )
  end

  def initialize(title =nil, url= nil, date= nil)
  @title = title
  @url = url
  @date = date
  @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(key_word)
    self.all.detect{|s| s.title.downcase.include? key_word}
  end


  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end



end
