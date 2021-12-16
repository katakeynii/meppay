require_relative "lib/mep_pay/version"

Gem::Specification.new do |spec|
  spec.name        = "mep_pay"
  spec.version     = MepPay::VERSION
  spec.authors     = ["Mohamed Camara Gueye"]
  spec.email       = ["katakeynii@gmail.com"]
  spec.homepage    = "https://monespaceperso.dgid.sn/login"
  spec.summary     = "Plugin permettra de pont au systeme de paiement de Gainde 2000"
  spec.description = "Plugin permettra de pont au systeme de paiement de Gainde 2000"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "annotate"
  spec.add_development_dependency "byebug"
  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.3"
end
