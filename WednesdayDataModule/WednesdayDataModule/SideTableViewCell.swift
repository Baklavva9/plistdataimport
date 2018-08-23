//
//  SideTableViewCell.swift
//  WednesdayDataModule
//
//  Created by Xcode Server on 22/8/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import CoreData

class SideTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
