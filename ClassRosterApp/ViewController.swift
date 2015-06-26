//
//  ViewController.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/4/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var people = [Student]()
  var myInfo = [String: Student]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadPeopleFromPlist()
    self.tableView.dataSource = self
   }
  
  private func loadPeopleFromPlist() {
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String: String]]
    {
      for object in peopleObjects {
        if let firstName = object["FirstName"],
          lastName = object["LastName"] {
            let person = Student(first: firstName, last: lastName)
            self.people.append(person)
        }
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! StudentCell
    

    let studentToDisplay = self.people[indexPath.row]
    
    if let image = studentToDisplay.image {
      cell.imageView?.image = image
    }

//    cell.layer.cornerRadius = 20.0
//    cell.backgroundColor = UIColor.blueColor()
    cell.studentImageView.layer.cornerRadius = 8


    
    cell.firstNameLabel.text = studentToDisplay.firstName
    cell.lastNameLabel.text = studentToDisplay.lastName
    
    
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        
        let indexPath = self.tableView.indexPathForSelectedRow()
        if let selectedRow = indexPath?.row {
          let selectedPerson = self.people[selectedRow]
          println(selectedPerson.firstName)
          detailViewController.selectedPerson = selectedPerson
        }
      }
    }
  }
}

