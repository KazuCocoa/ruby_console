# encoding: utf-8

def self.add_to_path path
 path = File.expand_path "../#{path}/", __FILE__

 $:.unshift path unless $:.include? path
end

add_to_path 'lib'

require 'appium_console/version'

Gem::Specification.new do |s|
  # 1.8.x is not supported
  s.required_ruby_version = '>= 1.9.3'

  s.name = 'appium_console'
  s.version = AppiumConsole::VERSION
  s.date = AppiumConsole::DATE
  s.license = 'http://www.apache.org/licenses/LICENSE-2.0.txt'
  s.description = s.summary = 'Ruby console for use with Appium'
  s.description += '.' # avoid identical warning
  s.authors = s.email = [ 'code@bootstraponline.com' ]
  s.homepage = 'https://github.com/appium/ruby_console' # published as appium_console
  s.require_paths = [ 'lib' ]

  # appium_lib version must match ruby console version.
  s.add_runtime_dependency 'appium_lib', ">= #{AppiumConsole::VERSION}"
  s.add_runtime_dependency 'pry', '~> 0.9.12'

  s.add_development_dependency 'rake', '~> 10.0.3'

  s.executables   = [ 'arc' ]
  s.files = `git ls-files`.split "\n"
end
