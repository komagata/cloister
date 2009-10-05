set :application, "cloister"
set :repository,  "git://github.com/komagata/cloister.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "docs.komagata.org"                   # Your HTTP server, Apache/etc
role :app, "docs.komagata.org"                   # This may be the same as your `Web` server
role :db,  "docs.komagata.org", :primary => true # This is where Rails migrations will run
role :db,  "docs.komagata.org"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end