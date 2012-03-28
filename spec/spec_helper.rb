require 'fakes'

Dir.chdir(File.join(File.dirname(__FILE__),"..,lib".split(','))) do
  require 'fakes-rspec.rb'
end
