class DevJobs::Scraper

  def get_page
     Nokogiri::HTML(open("https://stackoverflow.com/jobs?sort=i&q=full+stack&l=San+Francisco+Bay+Area%2C+CA%2C+United+States&d=20&u=Miles&c=usd&ms=Junior&mxs=Junior"))
  end

  def scrape_page
    self.get_page.xpath(".//div[@class='-title g-row']")
  end

  def make_new_job_titles
    scrape_page.each do |j|
      DevJobs::Job.new_from_scraper(j)
    end
  end

end
