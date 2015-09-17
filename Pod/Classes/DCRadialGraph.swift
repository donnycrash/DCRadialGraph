//
//  DCRadialGraph.swift
//  Pods
//
//  Created by Donovan Crewe on 2015/09/16.
//
//

@IBDesignable public class DCRadialGraph: UIView {
  
  @IBInspectable public var totalSegments: Int = 8
  @IBInspectable public var counter: Int = 2 {
    didSet {
      if counter <= totalSegments {
        animate()
      } else {
        counter = totalSegments
        animate()
      }
    }
  }
  
  private var label = UILabel()
  
  @IBInspectable public var arcOffset: CGFloat = 0.0
  @IBInspectable public var arcColor: UIColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
  @IBInspectable public var arcBgColor: UIColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
  @IBInspectable var arcWidth: CGFloat = 3
  
  private var segment:CAShapeLayer?
  @IBInspectable public var duration: CGFloat = 3.0
  @IBInspectable public var clockwise: Bool = false
  @IBInspectable public var percentFont: UIFont = UIFont(name: "HelveticaNeue-UltraLight", size: 33)!
  @IBInspectable public var autoLabel: Bool = true
  
  override public func prepareForInterfaceBuilder() {
    setup()
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  #if !TARGET_INTERFACE_BUILDER
  override public func layoutSubviews() {
    setup()
  }
  #endif
  
  var hasBgLayer = false
  
  func setup() {
    
    if autoLabel {
      addAutoLabel()
    }
    
    segment = CAShapeLayer()
    var backgroundLayer = CAShapeLayer()
    self.backgroundColor = UIColor.clearColor()
    let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
    let radius: CGFloat = max(bounds.width, bounds.height)
    var endAngle: CGFloat = CGFloat(2 * M_PI)
    var startAngle: CGFloat = 0
    
    backgroundLayer.path = UIBezierPath(arcCenter: center,
      radius: radius/2 - arcWidth/2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: clockwise).CGPath
    backgroundLayer.fillColor = UIColor.clearColor().CGColor
    backgroundLayer.lineWidth = arcWidth
    backgroundLayer.strokeColor = arcBgColor.CGColor
    if !hasBgLayer {
      self.layer.addSublayer(backgroundLayer)
      segment?.fillColor = UIColor.clearColor().CGColor
      segment?.lineWidth = arcWidth
      segment?.strokeColor = arcColor.CGColor
      self.layer.addSublayer(segment)
      hasBgLayer = true
    }
    animate()
  }
  
  func animate(){
    updateText()
    let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
    let arcLengthPerSegment = 2 * CGFloat(M_PI) / CGFloat(totalSegments)
    let segmentEndAngle = clockwise ? arcLengthPerSegment * CGFloat(counter) * -1 : arcLengthPerSegment * CGFloat(counter)
    var startAngle = clockwise ? arcOffset : segmentEndAngle + arcOffset
    var endAngle = clockwise ? segmentEndAngle + arcOffset : arcOffset
    segment?.path = UIBezierPath(arcCenter: center,
      radius: bounds.width/2 - arcWidth/2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: false).CGPath
    
    #if !TARGET_INTERFACE_BUILDER
      var drawAnimation: CABasicAnimation?
      if clockwise {
        segment?.strokeEnd = 1.0
        drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation?.toValue = 1
        drawAnimation?.fromValue = 0
      } else {
        drawAnimation = CABasicAnimation(keyPath: "strokeStart")
        drawAnimation?.toValue = 0
        drawAnimation?.fromValue = 1
      }
      var d = duration
      drawAnimation?.duration = CFTimeInterval(d)
      drawAnimation?.removedOnCompletion = true
      drawAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      drawAnimation?.delegate = self
      segment?.addAnimation(drawAnimation, forKey: "drawCircleAnimation")
    #endif
  }
  
  func addAutoLabel(){
    label.textColor = tintColor
    label.font = UIFont(name: percentFont.fontName, size: frame.height/2)
    label.frame = CGRectMake(0, bounds.height/6, bounds.width, label.font.lineHeight)
    label.textAlignment = NSTextAlignment.Center
    var sublabel = UILabel(frame: CGRectMake(label.bounds.origin.x, label.bounds.height - label.font.lineHeight/6, label.frame.width, label.font.lineHeight/6))
    sublabel.font = UIFont(name: percentFont.fontName, size: label.font.lineHeight/5)
    sublabel.text = "PERCENT"
    sublabel.textAlignment = label.textAlignment
    sublabel.textColor = label.textColor
    label.addSubview(sublabel)
    addSubview(label)
    bringSubviewToFront(label)
  }
  
  private func updateText(){
    var percent = Int(Float(counter)/Float(totalSegments) * 100)
    label.text = "\(percent)"
  }
}
