require 'developwithpassion_fakes'

Dir.chdir(File.join(File.dirname(__FILE__),"..,lib".split(','))) do
  require 'developwithpassion_fakes-rspec'
end
