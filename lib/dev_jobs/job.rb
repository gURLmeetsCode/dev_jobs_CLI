class DevJobs::Job
  attr_accessor :title, :company, :location, :date, :url


  def self.current
    self.scraped_jobs
  end


  def self.scraped_jobs
    jobs = []
    jobs << self.scrape_stackoverflow
    jobs
  end

  def self.find_by_name(title)
    self.current.detect do |j|
      j.title.downcase.strip == title.downcase.strip ||
      j.title.split("(").first.strip.downcase == title.downcase.strip
    end
  end

  def self.scrape_stackoverflow
    doc = Nokogiri::HTML(open("https://stackoverflow.com/jobs?sort=i&q=full+stack&l=San+Francisco+Bay+Area%2C+CA%2C+United+States&d=20&u=Miles&c=usd&ms=Junior&mxs=Junior"))
    job = self.new
    job.title = doc.css(".-job-summary").css("h2").inner_text.strip
    job.company = doc.css(".-job-summary").css(".-name").inner_text.strip
    job.date = doc.css(".-job-summary").css(".-posted-date").inner_text.strip
    job.location = doc.css(".-job-summary").css(".-location").inner_text.strip
    job.url = doc.css(".-job-summary").css("a").first.attr("href").strip

    job
  end


  # def self.find(id)
  #   self.current[id-1]
  # end

  # def title
  #   @title ||=doc.css(".-job-summary").css("h2").inner_text.strip
  # end
  #
  # def company
  #   @company ||=doc.css(".-job-summary").css(".-name").inner_text.strip
  # end
  #
  # def location
  #   @location ||=doc.css(".-job-summary").css(".-location").inner_text.strip
  # end
  #
  # def date
  #   @date ||=doc.css(".-job-summary").css(".-posted-date").inner_text.strip
  # end
  #
  # def url
  #   @url ||=doc.css(".-job-summary").css("a").first.attr("href").strip
  # end





end
