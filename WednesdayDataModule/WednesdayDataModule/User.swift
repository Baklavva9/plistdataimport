//
//  User.swift
//  WednesdayDataModule
//
//  Created by Xcode Server on 24/8/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var email: String
  
    init(name: String, email: String) {
        self.name = name
        self.email = email
     
    }
    
    convenience init() {
        self.init(name: "", email: "")
    }
}
