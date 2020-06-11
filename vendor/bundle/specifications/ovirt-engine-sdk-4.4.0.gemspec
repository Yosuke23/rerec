# -*- encoding: utf-8 -*-
# stub: ovirt-engine-sdk 4.4.0 ruby lib
# stub: ext/ovirtsdk4c/extconf.rb

Gem::Specification.new do |s|
  s.name = "ovirt-engine-sdk".freeze
  s.version = "4.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Juan Hernandez".freeze]
  s.date = "2020-04-08"
  s.description = "Ruby SDK for the oVirt Engine API.".freeze
  s.email = ["jhernand@redhat.com".freeze]
  s.extensions = ["ext/ovirtsdk4c/extconf.rb".freeze]
  s.files = ["ext/ovirtsdk4c/extconf.rb".freeze]
  s.homepage = "http://ovirt.org".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "oVirt SDK".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.79.0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0.9.12", "~> 0.9"])
      s.add_runtime_dependency(%q<json>.freeze, ["< 3", ">= 1"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.79.0"])
      s.add_dependency(%q<yard>.freeze, [">= 0.9.12", "~> 0.9"])
      s.add_dependency(%q<json>.freeze, ["< 3", ">= 1"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.79.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0.9.12", "~> 0.9"])
    s.add_dependency(%q<json>.freeze, ["< 3", ">= 1"])
  end
end
