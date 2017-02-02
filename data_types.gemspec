Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'data_types'
  s.summary = 'A Ruby gem that adds new object types like pairs and triplets.'
  s.version = '1.1.2'
  s.license = 'MIT'
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/data_types'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/data_types/issues'
  }
  s.files = [
    'lib/data_types.rb',
    'lib/data_types/pair.rb',
    'lib/data_types/triplet.rb'
  ]
end
