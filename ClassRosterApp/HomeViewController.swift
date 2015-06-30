//
//  HomeViewController.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/23/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var getStartedButton: UIButton!
  @IBOutlet weak var shadowView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayerProperties()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupLayerProperties() {
    getStartedButton.layer.cornerRadius = CGRectGetHeight(getStartedButton.bounds) / 2
    
    shadowView.layer.cornerRadius = 100
    shadowView.layer.shadowRadius = 10
    shadowView.layer.shadowOpacity = 1.0
    shadowView.layer.shadowOffset = CGSize.zeroSize
    shadowView.layer.shadowColor = UIColor.whiteColor().CGColor
    shadowView.backgroundColor = UIColor.whiteColor()
    shadowView.clipsToBounds = false
    
    self.imageView.backgroundColor = UIColor.blackColor()
    self.imageView.layer.cornerRadius = imageView.frame.size.width/2
    self.imageView.clipsToBounds = true
  }
}
