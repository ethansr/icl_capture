# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "icl_capture/version"

Gem::Specification.new do |s|
  s.name        = "icl_capture"
  s.version     = IclCapture::VERSION
  s.authors     = ["Ethan Soutar-Rau"]
  s.email       = ["ethan.soutar.rau@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Utilities for assisting in capture from UVC cameras}
  s.description = %q{Query available cameras and audio recording devices, find storage etc}

  #s.rubyforge_project = "icl_capture"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "sys-filesystem"
end
