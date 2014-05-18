ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)
require 'bundler'
Bundler.setup
Bundler.require :default, :test

require 'minitest/autorun'


lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)