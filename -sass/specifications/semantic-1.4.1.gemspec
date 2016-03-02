# -*- encoding: utf-8 -*-
# stub: semantic 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "semantic"
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Josh Lindsey"]
  s.date = "2015-04-20"
  s.description = "Semantic Version utility class for parsing, storing, and comparing versions. See: http://semver.org"
  s.email = ["josh@core-apps.com"]
  s.homepage = "https://github.com/jlindsey/semantic"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Semantic Version utility class"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
    else
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
  end
end
