#
# Be sure to run `pod lib lint QPTongdunSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QPTongdunSDK'
  s.version          = '3.1.0'
  s.summary          = 'A short description of QPTongdunSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/dearwayne/QPTongdunSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wayne' => '334064275@163.com' }
  s.source           = { :git => 'https://github.com/dearwayne/QPTongdunSDK.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'QPTongdunSDK/*.{h,m,swift}'
  s.public_header_files = 'QPTongdunSDK/*.h'
  s.library = 'resolv.9'
  s.frameworks = 'UIKit'
  s.dependency 'WeexSDK'
  s.vendored_libraries = 'QPTongdunSDK/libFMDeviceManager_without_IDFA.a'
end
