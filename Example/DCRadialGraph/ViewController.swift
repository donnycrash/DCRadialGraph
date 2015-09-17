//
//  ViewController.swift
//  DCRadialGraph
//
//  Created by Donovan Crewe on 09/16/2015.
//  Copyright (c) 2015 Donovan Crewe. All rights reserved.
//

import UIKit
import DCRadialGraph

class ViewController: UIViewController {
  
  @IBOutlet weak var bottomGraph: DCRadialGraph!
  @IBOutlet weak var topGraph: DCRadialGraph!
  var timer:NSTimer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topGraph.counter = 7
    timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector:Selector("countIncrease") , userInfo: nil, repeats: true)

  }
  
  @IBAction func countIncrease () {
    if (topGraph.counter < topGraph.totalSegments) {
      topGraph.counter = topGraph.counter + 4
    } else{
      timer?.invalidate()
    }
  }
}