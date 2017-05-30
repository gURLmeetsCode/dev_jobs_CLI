# CLI controller

class DevJobs::CLI
  def call
    start
    list
  end

# current bug: not printing an number list for job posts.
  def list
    puts ""
    puts "************* Latest Junior Dev Job Postings from Stack Over Flow *************"
    puts ""
    @jobs = DevJobs::Job.current
    @jobs.each.with_index(1) do |post, index|
      puts "#{index}. #{post.title} #{post.url}"
    end
    puts ""
  end

# current bug: printing entire list of jobs instead of just the relavant input

  def print_job(job)
    puts ""
    puts "-------------- #{job.title} --------------"
    puts ""
    puts "Company:            #{job.company}"
    puts "Location:           #{job.location}"
    puts "Website: #{job.url}"
    puts "Job Post Date: #{job.date}"
    puts ""
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts ""
      puts "What job would you like more information on? Type number"
      puts ""
      puts ""
      puts "Enter list to see the available jobs again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i > 0
        if job = @jobs[input.to_i-1]
          print_job(job)
        else
          puts "Sorry I do not recognize that command."
        end
      end
    end
    puts "Good luck with your job search!"
  end
end
