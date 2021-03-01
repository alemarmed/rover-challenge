require_relative "lib/rovers/version"

Gem::Specification.new do |spec|
  spec.name = "rovers"
  spec.version = Rovers::VERSION
  spec.authors = ["alemarmed"]
  spec.email = ["martin.medina.alejandro@gmail.com"]

  spec.summary = "Rovers on Mars code challenge"
  spec.homepage = "https://github.com/alemarmed/rover-challenge"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/alemarmed/rover-challenge/issues",
    "changelog_uri" => "https://github.com/alemarmed/rover-challenge/releases",
    "source_code_uri" => "https://github.com/alemarmed/rover-challenge",
    "homepage_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[README.md {bin,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
