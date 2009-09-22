namespace :p0t do
  desc "Fetch from csv file from web site."
  task :fetch do
    require "open-uri"
    url = "http://docs.komagata.org/index.csv?per_page=65565"
    path = "db/seeds/docs.csv"
    csv = open(url) {|f| f.read }
    open(path, "w") {|f| f.write(csv) }
  end

  desc "Reset documents."
  task :reset => [:fetch, "db:migrate:reset", "db:seed"] do
    puts "reset!"
  end
end
