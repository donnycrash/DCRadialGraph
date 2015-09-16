//
//  DCRadialGraph.swift
//  Pods
//
//  Created by Donovan Crewe on 2015/09/16.
//
//

@IBDesignable public class DCRadialGraph: UIView {
  
  @IBInspectable var totalSegments: Int = 8
  @IBInspectable var counter: Int = 2 {
    didSet {
      if counter <= totalSegments {
        animate()
      } else {
        counter = totalSegments
        animate()
      }
    }
  }
  
  @IBInspectable var arcOffset: CGFloat = 0.0
  @IBInspectable var arcColor: UIColor = UIColor.blueColor()
  @IBInspectable var arcBgColor: UIColor = UIColor.orangeColor()
  @IBInspectable var arcWidth: CGFloat = 3
  
  private var segment:CAShapeLayer?
  @IBInspectable var duration:CGFloat = 3.0
  @IBInspectable var clockwise:Bool = false
  @IBInspectable var percentFont:UIFont = UIFont(name: "HelveticaNeue-UltraLight", size: 33)!
  @IBInspectable var autoLabel:Bool = true
  
  override public func awakeFromNib() {
    setup()
  }
  
  override public func prepareForInterfaceBuilder() {
    setup()
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setup() {
    // Setup Auto label
    if autoLabel {
      addAutoLabel()
    }
    backgroundColor = UIColor.clearColor()
    // Graph Generation
    segment = CAShapeLayer()
    frame = CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.width);
    var backgroundLayer = CAShapeLayer()
    self.backgroundColor = UIColor.clearColor()
    let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
    let radius: CGFloat = max(bounds.width, bounds.height)
    var endAngle:CGFloat = CGFloat(2 * M_PI)
    var startAngle:CGFloat = 0
    
    backgroundLayer.path = UIBezierPath(arcCenter: center,
      radius: radius/2 - arcWidth/2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: clockwise).CGPath
    backgroundLayer.fillColor = UIColor.clearColor().CGColor
    backgroundLayer.lineWidth = arcWidth
    backgroundLayer.strokeColor = arcBgColor.CGColor
    
    self.layer.addSublayer(backgroundLayer)
    
    segment?.fillColor = UIColor.clearColor().CGColor
    segment?.lineWidth = arcWidth
    segment?.strokeColor = arcColor.CGColor
    self.layer.addSublayer(segment)
    animate()
  }
  
  func animate(){
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
      drawAnimation?.duration = CFTimeInterval(duration)
      drawAnimation?.removedOnCompletion = true
      drawAnimation?.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      
      segment?.addAnimation(drawAnimation, forKey: "drawCircleAnimation")
    #endif
  }
  
  func addAutoLabel(){
    var label = UILabel()
    var percent = Int(Float(counter)/Float(totalSegments) * 100)
    label.textColor = tintColor
    label.font = UIFont(name: percentFont.fontName, size: frame.height/2)
    label.frame = CGRectMake(0, frame.height/2 - label.font.lineHeight/2, frame.width, label.font.lineHeight)
    label.textAlignment = NSTextAlignment.Center
    label.text = "\(percent)"
    addSubview(label)
    bringSubviewToFront(label)
  }
}
