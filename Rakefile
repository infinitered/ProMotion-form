# -*- coding: utf-8 -*-
RM_VERSION = "2.33"
abort "RubyMotion #{RM_VERSION} not found. Run `sudo motion update --cache-version=2.33`." unless File.exist?("/Library/RubyMotion#{RM_VERSION}/lib")
$:.unshift("/Library/RubyMotion#{RM_VERSION}/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require
require 'ProMotion'
require 'ProMotion-form'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ProMotion-form'
end
