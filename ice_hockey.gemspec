require 'pathname'

Gem::Specification.new do |s|
  
  # Variables
  s.author      = 'Ryan Scott Lewis'
  s.email       = 'ryan@rynet.us'
  s.summary     = 'Ice hockey.'
  s.license     = 'MIT'
  
  # Dependencies
  s.add_dependency 'version', '~> 1.0.0'
  # s.add_development_dependency 'rspec', '~> 3.1.0'
  
  # Pragmatically set variables
  s.homepage      = "http://github.com/RyanScottLewis/#{s.name}"
  s.version       = Pathname.glob('VERSION*').first.read rescue '0.0.0'
  s.description   = s.summary
  s.name          = Pathname.new(__FILE__).basename('.gemspec').to_s
  s.require_paths = ['lib']
  s.files         = Dir['{{Rake,Gem}file{.lock,},README*,VERSION,LICENSE,*.gemspec,{lib,bin,examples,spec,test}/**/*}']
  s.test_files    = Dir['{examples,spec,test}/**/*']
  
end
