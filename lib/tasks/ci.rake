
desc "Run all the tests, called by the CI server"
task :ci => [:spec, :cucumber, :karma] do

end