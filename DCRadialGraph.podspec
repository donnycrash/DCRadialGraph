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
  s.summary          = "DCRadialGraph is a good looking, easy to use animated radial/circular graph view"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
DCRadialGraph is an IBDesignable subclass of UIView which allows you to create animated radial aka circular graphs. It's super good looking and really easily customised, change the animation direction, add an 'auto label' displaying the percent, change colors and stroke widths and a whole lot more.
                       DESC

  s.homepage         = "https://github.com/donnycrash/DCRadialGraph"
  # s.screenshots     = "https://github.com/donnycrash/DCRadialGraph/wiki/ss.png", "https://github.com/donnycrash/DCRadialGraph/wiki/radial.gif"
  s.license          = 'MIT'
  s.author           = { "Donovan Crewe" => "donovan@clevertech.biz" }
  s.source           = { :git => "https://github.com/donnycrash/DCRadialGraph.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/donovancrewe'

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
