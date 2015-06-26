//
//  StudentCell.swift
//  ClassRosterApp
//
//  Created by Alberto Vega Gonzalez on 6/22/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var studentImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//      self.studentImageView.layer.cornerRadius = imageView.frame.size.width/2
//      self.studentImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
