class TestJob
    include Sidekiq::Job
  
    def perform(*args)
      puts "Test job running with arguments: #{args.inspect}"
    end
  end
  