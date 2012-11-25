
Gem::Specification.new do |spec|

  spec.name        = "ppl"
  spec.version     = "0.3.0"
  spec.date        = "2012-11-23"

  spec.summary     = "CLI Address Book"
  spec.description = "CLI Address Book"
  spec.license     = "GPL-2"

  spec.authors     = ["Henry Smith"]
  spec.email       = "henry@henrysmith.org"

  spec.executables = "ppl"

  spec.files        = `git ls-files`.split("\n")
  spec.require_path = "lib"
  spec.homepage     = "https://github.com/h2s/ppl"

end

