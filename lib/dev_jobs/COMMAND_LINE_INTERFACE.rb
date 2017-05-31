# CLI controller

class DevJobs::CLI
  def call
    DevJobs::Scraper.new.make_new_job_titles
    start
  end

  def list
    puts ""
    puts "************* Latest Junior Dev Job Postings from Stack Over Flow *************"
    puts ""
    puts ""
    puts ""
    DevJobs::Job.all.each.with_index(1) do |job, index|
      puts "#{index}. #{job.title}"
    end
    puts ""
  end


  def display_jobs(job)
      puts "-------------- #{job.title} --------------"
      puts ""
      puts "Website:#{job.url}"
      puts "Job Post Date: #{job.date}"
      puts ""
      puts ""
  end




def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What job would you like more information on? Type number"
      puts ""
      puts "Enter list to see the jobs again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if job = DevJobs::Job.find_by_name(input)
          display_jobs(job)
        end
      elsif input.to_i > 0
        if job = DevJobs::Job.all[input.to_i-1]
          display_jobs(job)
        else
          puts "Sorry, im not sure we have what you are looking for. Type list to see the list of jobs again."
        end
      end
    end
    puts "Goodluck with your job search!"
  end
end
