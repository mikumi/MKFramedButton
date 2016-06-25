#
# Be sure to run `pod lib lint MKFramedButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKFramedButton'
  s.version          = '0.1.0'
  s.summary          = 'A UIButton with a frame'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Set the UIButton's borderWidth and borderColor, and the MKFramedButton will handle states properly.'
                       DESC

  s.homepage         = 'https://github.com/mikumi/MKFramedButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Kuck' => 'me@michael-kuck.com' }
  s.source           = { :git => 'https://github.com/mikumi/MKFramedButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/michaelkuckcom'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MKFramedButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MKFramedButton' => ['MKFramedButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'ChameleonFramework'
end
