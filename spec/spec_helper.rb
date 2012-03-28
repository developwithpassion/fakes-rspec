require 'developwithpassion_fakes'

Dir.chdir(File.join(File.dirname(__FILE__),"..,lib".split(','))) do
  require 'rspec-fakes.rb'
end
