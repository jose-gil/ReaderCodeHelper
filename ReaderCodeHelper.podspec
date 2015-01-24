#
# Be sure to run `pod lib lint ReaderCodeHelper.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = "ReaderCodeHelper"
  s.version          = "1.0.0"
  s.summary          = "Código de ayuda para el proyecto final tema 9: Reader"
  s.homepage         = "https://github.com/jose-gil/ReaderCodeHelper"
  s.license          = 'MIT'
  s.author           = { "Jose Gil" => "jose.gil@tollaga.com" }
  s.source           = { :git => "https://github.com/jose-gil/ReaderCodeHelper.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'ReaderCodeHelper/Code/*'
  s.resources = 'ReaderCodeHelper/Resources/*'

end
