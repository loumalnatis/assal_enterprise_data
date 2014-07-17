lib = File.expand_path('../lib/', __FILE__)

$:.unshift lib unless $:.include?(lib)

require 'assal_enterprise_data/version'

Gem::Specification.new do |s|
  s.name = 'assal_enterprise_data'
  s.description = 'Assal Enterprise Data'
  s.version = AssalEnterpriseData::VERSION
  s.authors = ['MOI']
  s.email = ['itsupport@loumalnatis.com']
  s.homepage = 'http://www.loumalnatis.com'
  s.summary = 'Assal Enterprise Data - Gem for accessing data from our incredible POS friends.'

  s.files = Dir['lib/**/*.rb']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'sequel', '4.8.0'
  s.add_runtime_dependency 'rake', '~> 10.1'
end
