Gem::Specification.new do |s|
  s.name          = 'apillary'
  s.version       = '0.0.1'
  s.date          = '2017-12-17'
  s.summary       = 'Apillary API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Daniel Lakin']
  s.email         = 'DLakin01@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/apillary'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'
end
