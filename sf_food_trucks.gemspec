lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'im_hungry/version'

Gem::Specification.new do |spec|
  spec.name          = 'im_hungry'
  spec.version       = ImHungry::VERSION
  spec.authors       = ['ANON']
  spec.email         = ['ANON@ANON.io']

  spec.summary       = 'Puts out the food trucks that are currently open in SF'
  spec.description   = 'Uses SF open data to find food trucks that are currently open.'
  spec.homepage      = 'https://github.com'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.executables = ['im_hungry']

  spec.add_dependency 'tzinfo', '2.0.5'
end
