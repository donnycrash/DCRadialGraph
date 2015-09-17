# DCRadialGraph

[![CI Status](http://img.shields.io/travis/Donovan Crewe/DCRadialGraph.svg?style=flat)](https://travis-ci.org/Donovan Crewe/DCRadialGraph)
[![Version](https://img.shields.io/cocoapods/v/DCRadialGraph.svg?style=flat)](http://cocoapods.org/pods/DCRadialGraph)
[![License](https://img.shields.io/cocoapods/l/DCRadialGraph.svg?style=flat)](http://cocoapods.org/pods/DCRadialGraph)
[![Platform](https://img.shields.io/cocoapods/p/DCRadialGraph.svg?style=flat)](http://cocoapods.org/pods/DCRadialGraph)

##### DCRadialGraph is a good looking, easy to use, drop in radial/circular graph view

![Radial Animation](https://github.com/donnycrash/DCRadialGraph/wiki/radial.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DCRadialGraph is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DCRadialGraph"
```
## Usage
`totalSegments: Int` The total amount of segments in the graph

`counter: Int` The current amount eg.(**23**/100)

`arcOffset: CGFloat`  The starting point of the graph.

`arcColor: UIColor` The color of filled segments in the graph.

`arcBgColor: UIColor` The color of the background (Full circle).

`arcWidth: CGFloat` The width of the graphs ring. *Default 3pt*

`duration: CGFloat` The duration of the graphs animation *Default 3sec*

`clockwise: Bool` Whether the graph should animate clockwise or not *Default false*

`percentFont:UIFont` The font which the percent label should be. Currently the size is calculated based in the size if the graph. The color of the font is set by the general `tintColor`

`autoLabel:Bool` Whether it should have a percent label or not *Deafult true* 


## Author

Donovan Crewe, donovan@clevertech.biz

## License

DCRadialGraph is available under the MIT license. See the LICENSE file for more info.
