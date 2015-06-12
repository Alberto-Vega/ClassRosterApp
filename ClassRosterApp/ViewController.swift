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
  
  var students = [Student]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    let alberto = Student(first: "Alberto", last: "Vega")
    let adam = Student(first: "Adam", last: "Wallraff")
    let molly = Student(first: "Molly", last: "Kent")
    let nicholas = Student(first: "Nicholas", last: "Von Pentz")
    let richard = Student(first: "Richard", last: "Woolley")
    let benjamin = Student(first: "Benjamin", last: "Laddin")
    let bob = Student(first: "Bob", last: "Glass")
    let brad = Student(first: "Brad", last: "Johnson")
    let brandon = Student(first: "Brandon", last: "Roberts")
    let chris = Student(first: "Chris", last: "Olds")
    let cierra = Student(first: "Cierra", last: "Figaro")
    let craig = Student(first: "Craig", last: "Chaillie")
    let edrease = Student(first: "Edrease", last: "Peshtaz")
    let heidi = Student(first: "Heide", last: "Laursen")
    let jeremy = Student(first: "Jeremy", last: "Moore")
    let joao = Student(first: "Joao", last: "Alves")

    students += [alberto, adam, molly, nicholas, richard, benjamin, bob, brad, brandon, chris, cierra, craig, edrease, heidi, jeremy,joao]
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.students.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

  let studentToDisplay = self.students[indexPath.row]
  cell.textLabel?.text = studentToDisplay.firstName + " " + studentToDisplay.lastName
  return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      let detailViewController = segue.destinationViewController as! DetailViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPerson = self.students[selectedRow]
      println(selectedPerson.firstName)
      detailViewController.selectedPerson = selectedPerson
    }
  }
}

