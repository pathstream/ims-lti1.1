lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ims/lti1_1/version'

Gem::Specification.new do |s|
  s.name = %q{ims-lti1.1}
  s.version = IMS::LTI1_1::VERSION

  s.add_dependency 'builder', '>= 1.0', '< 4.0'
  s.add_dependency 'oauth', '>= 0.4.5'
  s.add_dependency 'rexml'

  s.add_development_dependency 'rspec', '~> 3.0', '> 3.0'

  s.authors = ["Instructure"]
  s.extra_rdoc_files = %W(LICENSE)
  s.license = 'MIT'
  s.files = Dir["{lib}/**/*"] + ["LICENSE", "README.md", "Changelog"]
  s.homepage = %q{http://github.com/instructure/ims-lti}
  s.require_paths = %W(lib)
  s.summary = %q{Ruby library for creating IMS LTI tool providers and consumers}
end
