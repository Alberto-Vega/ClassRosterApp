//
//  DetailViewController.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/10/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var studentFirstNameTextField: UITextField!
  @IBOutlet weak var studentLastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var bottomOfScreenView: UIView!
  @IBOutlet weak var cameraButton: UIButton!
  var selectedPerson: Student?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.imageView.layer.cornerRadius = imageView.frame.size.width/2
    self.imageView.clipsToBounds = true
    self.bottomOfScreenView.layer.cornerRadius = 8
    self.cameraButton.layer.cornerRadius = 10
    self.setupTextFields()
  }
  
  private func setupTextFields() {
    self.studentFirstNameTextField.delegate = self
    self.studentLastNameTextField.delegate = self
    self.studentFirstNameTextField.tag = 0
    self.studentLastNameTextField.tag = 1
    
    if let person = selectedPerson {
      self.studentFirstNameTextField.text = self.selectedPerson?.firstName
      self.studentLastNameTextField.text = self.selectedPerson?.lastName
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedPerson?.firstName = textField.text
    } else {
      self.selectedPerson?.lastName = textField.text
    }
  }
  
  @IBAction func updateButtonPressed(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }
  @IBAction func photoButtonPressed(sender: UIButton) {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
  let image = info[UIImagePickerControllerEditedImage] as? UIImage
    self.imageView.image = image
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}
