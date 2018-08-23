//
//  UserPL+CoreDataProperties.swift
//  WednesdayDataModule
//
//  Created by Xcode Server on 22/8/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//
//

import Foundation
import CoreData


extension UserPL {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPL> {
        return NSFetchRequest<UserPL>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?

}
