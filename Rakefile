task :default => ["ssa_national.csv", "kantrowitz.csv"]

desc "Munge the Kantrowitz corpus"
file "kantrowitz.csv" => "kantrowitz.r" do
  sh "R --vanilla CMD BATCH kantrowitz.r"
end

desc "Munge the Social Security Administration data"
file "ssa_national.csv" => "ssa.r" do
  sh "R --vanilla CMD BATCH ssa.r"
end

require "rake/clean"
CLOBBER.include("ssa_national.csv", "ssa_national.rda",
                "kantrowitz.csv", "kantrowitz.rda")

