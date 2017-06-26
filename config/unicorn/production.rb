# production.rb
current_path = "/var/www/blog/current"
shared_path = "/var/www/blog/shared"
working_directory current_path
stderr_path "#{current_path}/log/unicorn.log"
stdout_path "#{current_path}/log/unicorn.log"

listen File.expand_path('tmp/sockets/unicorn.sock', shared_path)
pid File.expand_path('tmp/pids/unicorn.pid', shared_path)

worker_processes 2
timeout 30

preload_app true

stdout_path "#{current_path}/log/production.log"
stderr_path "#{current_path}/log/production.log"

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{current_path}/Gemfile"
end

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there"s no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{current_path}/tmp/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end