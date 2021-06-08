#
# Be sure to run `pod lib lint DLCommonTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DLCommonTool'
  s.version          = '0.1.0'
  s.summary          = '常用类'

  s.homepage         = 'https://github.com/LwqDeveloper/DLCommonTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LwqDeveloper' => 'lee_weiqiong@163.com' }
  s.source           = { :git => 'https://github.com/LwqDeveloper/DLCommonTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DLCommonTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DLCommonTool' => ['DLCommonTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
