# -*- coding: utf-8 -*-
RM_VERSION = "2.36" # Also change in .travis.yml
abort "RubyMotion #{RM_VERSION} not found. Run `sudo motion update --cache-version=#{RM_VERSION}`." unless File.exist?("/Library/RubyMotion#{RM_VERSION}/lib")
$:.unshift("/Library/RubyMotion#{RM_VERSION}/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require
require 'ProMotion'
require 'ProMotion-form'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ProMotion-form'
  app.device_family = [:iphone, :ipad]
end
