# -*- encoding: utf-8 -*-
# stub: rspec-autotest 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-autotest"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steven Baker", "David Chelimsky", "Chad Humphries"]
  s.date = "2014-06-01"
  s.description = "RSpec Autotest integration"
  s.email = "rspec-users@rubyforge.org"
  s.homepage = "https://github.com/rspec/rspec-autotest"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.4.8"
  s.summary = "rspec-autotest-1.0.0"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-core>, ["< 4.0.0", ">= 2.99.0.beta1"])
      s.add_development_dependency(%q<bundler>, [">= 1.3"])
      s.add_development_dependency(%q<rake>, [">= 10.0.0"])
      s.add_development_dependency(%q<ZenTest>, [">= 4.6"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0"])
    else
      s.add_dependency(%q<rspec-core>, ["< 4.0.0", ">= 2.99.0.beta1"])
      s.add_dependency(%q<bundler>, [">= 1.3"])
      s.add_dependency(%q<rake>, [">= 10.0.0"])
      s.add_dependency(%q<ZenTest>, [">= 4.6"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rspec-core>, ["< 4.0.0", ">= 2.99.0.beta1"])
    s.add_dependency(%q<bundler>, [">= 1.3"])
    s.add_dependency(%q<rake>, [">= 10.0.0"])
    s.add_dependency(%q<ZenTest>, [">= 4.6"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
  end
end
