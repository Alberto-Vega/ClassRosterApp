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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let peopleFromArchive = self.loadFromArchive() {
      self.people = peopleFromArchive
    } else {
      self.loadPeopleFromPlist()
      self.saveToArchive()
    }
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
    self.saveToArchive()
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! StudentCell
    
    cell.studentImageView.layer.cornerRadius = 8
    cell.studentImageView.layer.masksToBounds = true
    cell.studentImageView.layer.borderWidth = 0.3
    cell.studentImageView.layer.borderColor = UIColor.whiteColor().CGColor
    
    cell.studentImageShadowView.backgroundColor = UIColor.blackColor()
    cell.studentImageShadowView.layer.cornerRadius = cell.studentImageShadowView.frame.size.width/2
    cell.studentImageShadowView.layer.shadowRadius = 4
    cell.studentImageShadowView.layer.shadowOpacity = 1.0
    cell.studentImageShadowView.layer.shadowOffset = CGSize.zeroSize
    
    let studentToDisplay = self.people[indexPath.row]
    
    if let image = studentToDisplay.image {
      cell.studentImageView.image = image
    }
    
    cell.firstNameLabel.text = studentToDisplay.firstName
    cell.lastNameLabel.text = studentToDisplay.lastName
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == studentToDisplay.firstName {
      cell.backgroundColor = UIColor.lightGrayColor()
    }
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
  
  func saveToArchive() {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      println(archivePath)
      NSKeyedArchiver.archiveRootObject(self.people, toFile: archivePath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Student]? {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Student] {
        return peopleFromArchive
      }
    }
    return nil
  }
}
