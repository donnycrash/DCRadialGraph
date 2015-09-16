#
# Be sure to run `pod lib lint DCRadialGraph.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DCRadialGraph"
  s.version          = "0.1.0"
  s.summary          = "DCRadialGraph is a subclass of UIView which draws animated radial graphs."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
DCRadialGraph is an IBDesignable subclass of UIView which allows you to easily create animated radial graphs. It's really easily customised, change the animation direction, add an 'auto label' displaying the percent, change colors and stroke widths.
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/DCRadialGraph"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Donovan Crewe" => "donovan@clevertech.biz" }
  s.source           = { :git => "https://github.com/donnycrash/DCRadialGraph.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DCRadialGraph' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
