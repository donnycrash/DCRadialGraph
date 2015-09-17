//
//  ViewController.swift
//  DCRadialGraph
//
//  Created by Donovan Crewe on 09/16/2015.
//  Copyright (c) 2015 Donovan Crewe. All rights reserved.
//
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}

import UIKit
import DCRadialGraph

class ViewController: UIViewController {
  
  @IBOutlet weak var bottomGraph: DCRadialGraph!
  @IBOutlet weak var topGraph: DCRadialGraph!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    topGraph.counter = 7
    bottomGraph.counter = 12
    
  }
  
}