//
//  DetailViewController.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/10/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var studentNameLabel: UILabel!
  @IBOutlet weak var studentLastNameLabel: UILabel!
  var selectedPerson: Student!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.studentNameLabel.text = self.selectedPerson.firstName
      self.studentLastNameLabel.text = self.selectedPerson.lastName
      

        // Do any additional setup after loading the view.
    }


}
