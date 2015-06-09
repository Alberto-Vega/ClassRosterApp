//
//  ViewController.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/4/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var studentNameLabel: UILabel!
  
  let students = ["Heidi", "Joao", "Alberto", "Richard", "Karinne"]
  var currentIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    studentNameLabel.text = self.students[0]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func nextButtonPressed(sender: UIButton) {
    if currentIndex < students.count - 1 {
      currentIndex += 1
      println(self.currentIndex)
    } else {
      currentIndex = students.count - 1
    }
    let studentName = students[currentIndex]
    studentNameLabel.text = studentName
  }
  
  @IBAction func previousButtonPressed(sender: UIButton) {
    if currentIndex > 0 {
      currentIndex -= 1
      println(self.currentIndex)
    } else {
      currentIndex = 0
    }
    let studentName = students[currentIndex]
    studentNameLabel.text = studentName
  }
}

