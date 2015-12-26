Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'data_types'
  s.summary = 'A Ruby gem that adds new object types like pairs and triplets.'
  s.version = '1.0.0'
  s.license = 'CC-BY-NC-ND-4.0'
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/data_types'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/data_types/issues'
  }
  s.files = [
    'spec/pair_test_cases.rb',
    'spec/triplet_test_cases.rb',
    'lib/data_types.rb',
    'lib/data_types/pair.rb',
    'lib/data_types/triplet.rb'
  ]
end
