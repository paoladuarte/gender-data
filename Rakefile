multitask :default => ["ssa_national.csv", "ssa_state.csv", "kantrowitz.csv"]

desc "Munge the Kantrowitz corpus"
file "kantrowitz.csv" => "kantrowitz.r" do
  sh "R --vanilla CMD BATCH kantrowitz.r"
end

desc "Munge the national Social Security Administration data"
file "ssa_national.csv" => "ssa.r" do
  sh "R --vanilla CMD BATCH ssa.r"
end

desc "Munge the state Social Security Administration data"
file "ssa_state.csv" => "ssa_state.r" do
  sh "R --vanilla CMD BATCH ssa_state.r"
end

require "rake/clean"
CLOBBER.include("ssa_national.csv", "ssa_national.rda",
                "kantrowitz.csv", "kantrowitz.rda",
                "ssa_state.csv", "ssa_state.rda")

