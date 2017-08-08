#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftTransition'
  s.version          = '1.1'
  s.summary          = 'View controller transition animation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Beautiful transition animation for view conrollers
                       DESC

  s.homepage         = 'https://github.com/malkouz/SwiftTransition'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Moayad Al kouz' => 'moayad_kouz9@hotmail.com' }
  s.source           = { :git => 'https://github.com/malkouz/SwiftTransition.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/malkouz'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftTransition/Classes/**/*'
  
end
