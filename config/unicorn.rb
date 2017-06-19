application = 'reserve-hacker'

worker_processes 2
app_path = "/var/www/blog"

shared_path = app_path + "/shared"
current_path = app_path + "/current"

listen File.expand_path('tmp/sockets/unicorn.sock', shared_path)
pid File.expand_path('tmp/pids/unicorn.pid', shared_path)

timeout 30

preload_app true

stdout_path "#{current_path}/log/production.log"
stderr_path "#{current_path}/log/production.log"

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

working_directory current_path

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', current_path)
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
