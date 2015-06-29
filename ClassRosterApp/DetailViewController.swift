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
  @IBOutlet weak var shadowView: UIView!
  @IBOutlet weak var bottomOfScreenView: UIView!
  @IBOutlet weak var cameraButton: UIButton!
  @IBOutlet weak var detailScrollView: UIScrollView!
  
  var selectedPerson: Student?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let shadowView = UIView(frame:CGRect(x:0, y:0, width:self.imageView.frame.width, height: self.imageView.frame.height))
//    shadowView.frame = imageView.bounds


    
    self.imageView.backgroundColor = UIColor.blackColor()
    self.imageView.layer.cornerRadius = imageView.frame.size.width/2
    self.imageView.clipsToBounds = true
    
    shadowView.layer.cornerRadius = shadowView.frame.size.width/2
    shadowView.layer.shadowRadius = 4
    shadowView.layer.shadowOpacity = 1.0
    shadowView.layer.shadowOffset = CGSize.zeroSize
    shadowView.layer.shadowColor = UIColor.blackColor().CGColor
    shadowView.backgroundColor = UIColor.whiteColor()
    shadowView.clipsToBounds = false
    
//    self.imageView.addSubview(shadowView)
    
//    imageView.layer.borderWidth = 12
//    imageView.layer.borderColor = UIColor.whiteColor().CGColor
    
    imageView.layer.shadowRadius = 4
    imageView.layer.shadowOpacity = 1.0
    imageView.layer.shadowOffset = CGSize.zeroSize
    
    self.bottomOfScreenView.layer.cornerRadius = 8
    self.cameraButton.layer.cornerRadius = 10
    self.setupTextFields()
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  func keyboardWillShow(notification: NSNotification) {
    adjustInsetForKeyboardShow(true, notification: notification)
  }
  
  func keyboardWillHide(notification: NSNotification) {
    adjustInsetForKeyboardShow(false, notification: notification)
  }
  
  func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
    let userInfo = notification.userInfo ?? [:]
    let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
    let adjustmentHeight = (CGRectGetHeight(keyboardFrame) + 20) * (show ? 1 : -1)
    
    detailScrollView.contentInset.bottom += adjustmentHeight
    detailScrollView.scrollIndicatorInsets.bottom += adjustmentHeight
  }
  
  private func setupTextFields() {
    self.studentFirstNameTextField.delegate = self
    self.studentLastNameTextField.delegate = self
    self.studentFirstNameTextField.tag = 0
    self.studentLastNameTextField.tag = 1
    
    if let person = selectedPerson {
      self.studentFirstNameTextField.text = person.firstName
      self.studentLastNameTextField.text = person.lastName
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
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  @IBAction func myPhotosButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
      self.imageView.image = image
      self.selectedPerson?.image = image
    }
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}
