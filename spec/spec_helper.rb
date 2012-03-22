require 'developwithpassion_fakes'
require 'rspec'

Dir.chdir(File.join(File.dirname(__FILE__),"..,lib".split(','))) do
  Dir.glob("**/*.rb").each do |file| 
    full_path = File.expand_path(file)
    $:.unshift File.expand_path(File.dirname(full_path))
    require full_path
  end
end
